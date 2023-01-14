//
//  File.swift
//  I'd Eat There
//
//  Created by Brilyante Apps LLC on 1/3/23.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift
import Contacts
import FirebaseStorage

class UserManagerModel : NSObject, ObservableObject {
    
     // TODO: NEED TO CREATE A SEPERATE DATA SERVICE MODEL
    
    
    let db = Firestore.firestore()
    
    // Initializers
    @Published var loggedIn : Bool = false
    @Published var loginFormShowing : Bool = false
    @Published var createUserFormShowing : Bool = false
    @Published var editUserInformation : Bool =  false
    
    @Published var email : String = ""
    @Published var firstName : String = ""
    @Published var lastName : String = ""
    @Published var phone : String = ""
    @Published var photo : UIImage?
    @Published var verificationCode : String = ""
    @Published var password : String = ""
    @Published var errorMessage : String?
    @Published var userName : String = ""
    @Published var newUser : Bool = true
    
    // MARK: - Check Login / New User
    func checkLogin() {
        self.loggedIn = Auth.auth().currentUser == nil ? false : true
        self.userInfo()
    }
    
    func isUserAdmin() {
        
        //TODO: Check if user is admin
    }
    
    func isNewUser() {
        
        
        
    }
    //MARK: -- Reload
    
    func reloadView() {
        objectWillChange.send()
    }
    
    
    // MARK: - Sign In
    func signIn() {
        Auth.auth().signIn(withEmail: self.email, password: self.password) { result, error in
            
            // Run in the main thread, don't update any UI in the background
            DispatchQueue.main.async { [self] in
                
                if error == nil {
                    
                    // dismiss login form sheet view
                    self.loginFormShowing = false
                    self.userInfo()
                    
                }
                else {
                    
                    // If there's an issue with logging in
                    self.errorMessage = error!.localizedDescription
                }
            }
        }
    }
    
    // MARK: -- Sign Out
    
    func signOut() {
        try! Auth.auth().signOut()
        self.loggedIn = false
    }
    
    // MARK: -- Phone Number Auth and Verification
    
    func sendPhoneNumber(phone: String, completion: @escaping (Error?) -> Void) {
        
        // Send the phone number to firebase auth
        PhoneAuthProvider.provider().verifyPhoneNumber(String("+1\(phone)"), uiDelegate: nil) { verificationId, error in
            
            if error == nil {
                
                // Got the verification id and save to local storage
                UserDefaults.standard.set(verificationId, forKey: Constants.verificationIdStorageKey)
                completion(error)
                
            }
            
            
            DispatchQueue.main.async {
                // Notify the UI
                completion(error)
            }
            
        }
    }
    
    func verifyCode(code: String, completion: @escaping (Error?) -> Void) {
        
        // Get the verification id from local storage
        let verificationId = UserDefaults.standard.string(forKey: Constants.verificationIdStorageKey) ?? ""
        
        // Send the code and the verificaiton id to firebase
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationId, verificationCode: code)
        
        // Sign in the user
        Auth.auth().signIn(with: credential) { authResult, error in
            
            
            if error == nil {
                
                self.loggedIn = Auth.auth().currentUser == nil ? false : true
                DispatchQueue.main.async {
                    
                    // Notify the UI
                    completion(error)
                }
                
            }
            
        }
        
    }
    
    // MARK: - Create Account
    func createAccount() {
        Auth.auth().createUser(withEmail: self.email, password: self.password) { result, error in
            
            DispatchQueue.main.async { [self] in
                if error == nil {
                    
                    // Save the firstName
                    self.saveFirstName()
                    
                    // Dismiss the form
                    self.createUserFormShowing = false
                    
                    // update user info
                    self.userInfo()
                    
                    // No longer a new user
                    self.newUser = false
                    
                    // Auto Sign in
                    self.checkLogin()
                    
                }
                else {
                    
                    self.errorMessage = error!.localizedDescription
                }
            }
            
        }
    }
    
    // MARK: - User Info
    func userInfo() {
        
        guard let userID = Auth.auth().currentUser?.uid else {
            return
        }
        let username = db.collection("users").document(userID)
        
        username.getDocument(source: .cache) { [self] (document, error) in
            if let document = document {
                self.firstName = document.get("firstName") as! String
            }
            else {
                
                // error
            }
        }
    }
    
    // MARK: - Save First Name
    func saveFirstName() {
        
        if let currentUser = Auth.auth().currentUser {
            let cleansedFirtName = self.firstName.trimmingCharacters(in: .whitespacesAndNewlines)
            
            let path = db.collection("users").document(currentUser.uid)
            
            path.setData(["firstName":cleansedFirtName]) {error in
                if error == nil {
                    // save
                    self.userInfo()
                }
                else {
                    // error
                }
            }
        }
    }
    
    // MARK: - Get Platform Users
    func getPlatformUsers(localContacts: [CNContact], completion: @escaping ([User]) -> Void) {
        
        // Array we are storing fetched platform users
        var platformUsers = [User]()
        
        // Construct an array of string phone numbers to look up
        var lookupPhoneNumbers = localContacts.map { contact in
            
            // Turn the contact into a phone number as a string
            return PhoneTextHelper.sanitizePhoneNumber(phone: contact.phoneNumbers.first?.value.stringValue ?? "")
        }
        
        
        // Make sure there are lookup numbers
        
        guard lookupPhoneNumbers.count > 0 else {
            completion(platformUsers)
            return
        }
        
        // Perform the queries while we still have phone numbers to look up
        while !lookupPhoneNumbers.isEmpty {
            
            // Get the first < 10 phone numbers to look up
            let tenPhoneNumbers = Array(lookupPhoneNumbers.prefix(10))
            
            // Remove the < 10 that we're looking for
            lookupPhoneNumbers = Array(lookupPhoneNumbers.dropLast(10))
            
            let query  = db.collection("users").whereField("phone", in: tenPhoneNumbers)
            
            // Retrieve the users that are on the platform
            query.getDocuments { snapshot, error in
                
                // Check if errors
                if error == nil && snapshot != nil {
                    
                    // For each doc that was fetched, create a user
                    for doc in snapshot!.documents {
                        
                        if let user = try? doc.data(as: User.self) {
                            
                            // Append to the platform users array
                            platformUsers.append(user)
                            
                            
                        }
                    }
                    
                    // Check if we have anymore phone numbers to look up
                    // If not, we can call the completing block and we're done
                    
                    if lookupPhoneNumbers.isEmpty {
                        // Return these users
                        completion(platformUsers)
                    }
                }
            }
        }
    }
    
    // MARK: - Set User Profile
    
    func setUserProfile(firstName: String, lastName: String, photo: UIImage?, completion: @escaping (Bool) -> Void) {
        
        // Guard if logged out
    //    if let currentUser = Auth.auth().currentUser {
            
            // Set the profile data
           let path = db.collection("users").document()
            
            path.setData(["firstName" : firstName,
                          "lastName" : lastName,
                          "phone" : self.phone])
                       //   "photo" : photo])
            
            
   //     }
        
        // Check if an image is passed through
        
        if let photo = photo {
            
            // Create storage reference
            let storageRef = Storage.storage().reference()
            
            // turn our image into data
            let imageData = photo.jpegData(compressionQuality: 0.8)
            
            // check that we were able to convert it to data
            guard imageData != nil else {
                return
            }
            
            // Specify the file path and name
            let imagePath = "images/\(UUID().uuidString).jpeg"
            let fileRef = storageRef.child(imagePath)
            
            let uploadTask = fileRef.putData(imageData!, metadata: nil) { meta, error in
                
                if error == nil && meta != nil {
                    path.setData(["photo" : imagePath], merge : true) {error in
                        
                        if error == nil {
                            
                            // success, notify caller
                            completion(true)
                        }
                        
                        else {
                            completion(false)
                        }
                        
                    }
                    
                    
                }
                else {
                    
                    
                }
                
            }
            
        }
    }
}
