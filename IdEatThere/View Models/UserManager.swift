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
    
    @Published var userId : String = ""
    @Published var email : String = ""
    @Published var firstName : String = ""
    @Published var lastName : String = ""
    @Published var phone : String = ""
    @Published var photo : UIImage?
    @Published var profilePhoto : String?
    @Published var verificationCode : String = ""
    @Published var password : String = ""
    @Published var errorMessage : String?
    @Published var userName : String = ""
    @Published var newUser : Bool = true
    
    @Published var completedOnboarding : Bool = false
    
    
    // MARK: - Check Login / New User
    func checkLogin() -> Bool {
        self.loggedIn = Auth.auth().currentUser == nil ? false : true
 //       self.userInfo()
        
        return self.loggedIn
    }
    
    // TODO: NEED TO SET THIS UP
    func appLaunch_listener() {
        
        Auth.auth().addStateDidChangeListener({ auth, user in
            
            if user != nil {
                
                print("user is logged in")
                self.loggedIn = true
                print(self.loggedIn)
            }
            
            else {
                print("user is not logged in")
                self.loggedIn = false
            }
            
            
        })
        
    }
    
    func getLoggedInUserPhone() -> String {
        
        self.phone = PhoneTextHelper.sanitizePhoneNumber(phone: Auth.auth().currentUser?.phoneNumber ?? "")
        
        return self.phone
    }
    
    func getLoggedInUserId() -> String {
        self.userId = Auth.auth().currentUser?.uid ?? ""
        
        return self.userId
        
    }
    
    func isNewUser() {
        
        
        
    }
    
    
    // MARK: - Sign In
    
//    func signIn() {
//        Auth.auth().signIn(with: <#T##AuthCredential#>)
//
//
//    }
//    func signIn() {
//        Auth.auth().signIn(withEmail: self.email, password: self.password) { result, error in
//
//            // Run in the main thread, don't update any UI in the background
//            DispatchQueue.main.async { [self] in
//
//                if error == nil {
//
//                    // dismiss login form sheet view
//                    self.loginFormShowing = false
//                    self.userInfo()
//
//                }
//                else {
//
//                    // If there's an issue with logging in
//                    self.errorMessage = error!.localizedDescription
//                }
//            }
//        }
//    }
    
    // MARK: -- Sign Out
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.loggedIn = false
        }
        catch let error {
            print(error)
        }
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
                
                self.userInfo()
                
                DispatchQueue.main.async {
                    
                    // Notify the UI
                    completion(error)
                }
                
            }
            
        }
        
    }
    
    // MARK: - Create Account
    func createAccount(email: String, password: String, completion: @escaping (Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in

          
                if error == nil {
                    
                    DispatchQueue.main.async {
                        
                        // Notify the UI
                        completion(error)
                    }

                    
                }
                else {
                    completion(error)
                    self.errorMessage = error!.localizedDescription
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
                self.lastName = document.get("lastName") as! String
                self.phone = document.get("phone") as! String
                self.profilePhoto = document.get("photo") as? String
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
        
        // Guard if logged in
        guard self.checkLogin() != false else {
            // user is not logged in
            return
            
        }
        
        // Get user's phone
        let userPhone = self.getLoggedInUserPhone()
        
        // Get user's uid and set document id
        let usersDocumentId = self.getLoggedInUserId()
        
            
        // Set the profile data
        let path = db.collection("users").document(usersDocumentId)
            
        path.setData(["firstName" : self.firstName,
                      "lastName" : self.lastName,
                          "phone" : userPhone])
                       //   "photo" : photo])
        
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
                    
                    // Get full url to image
                    fileRef.downloadURL { url, error in
                        
                        // Check for errors
                        if url != nil && error == nil {
                            
                            // set the image path to the profile
                            path.setData(["photo" : url!.absoluteString], merge : true) {error in
                                
                                if error == nil {
                                    
                                    // success, notify caller
                                    completion(true)
                                    
                                }
                                
                                else {
                                    completion(false)
                                }
                                
                            }
                            
                        }
                        // URL download wasn't succesful
                        else {
                            completion(false)
                        }
                        
                    }
                    
                }
                else {
                    
                    
                }
                
            }
            
        }
        else {
            // No image was selected
            completion(true) // allows user to continue
        }
        
        self.loggedIn = Auth.auth().currentUser == nil ? false : true

    }
    
    func checkUserProfile(completion: @escaping (Bool) -> Void) {
        
        // Check that the user is logged in
        
        guard self.checkLogin() != false else {
            
            return
            
        }
        
        // Create firebase ref
        
        self.db.collection("users").document(self.getLoggedInUserId()).getDocument { snapshot, error in
            
            // TODO: Keep the users profile data
            
            if snapshot != nil && error == nil {
                
                // Notify users the profile exists
                completion(snapshot!.exists)
                self.loggedIn = true
                
            }
            
            else {
                
                completion(false)
                
            }
            
            
            
            
        }
        
        
        
    }
    
    // MARK: - Create Group
    
    func userGroups(completion: @escaping ([Groups]) -> Void) {
        
        guard self.checkLogin() != false else {
            
            return
            
        }
        
        var groupsAttending = [Groups]()

        self.userId = self.getLoggedInUserId()
 
        let attendee = self.userId
        
        let fieldlookup = Array(attendee)
        
        let query = db.collection("groups").whereField("Attendees", arrayContains: attendee)
        
        query.getDocuments { snapshot, error in
            
            // Check if errors
            if error == nil && snapshot != nil {
                
                // For each doc the was fetched, append to groupsArray
                
                for doc in snapshot!.documents {
                    
                    if let groups = try? doc.data(as: Groups.self) {
                        
                            groupsAttending.append(groups)
                    }
                }
                
                completion(groupsAttending)
            }

        }

    }
}
