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

class UserManagerModel : NSObject, ObservableObject {
    
    
    let db = Firestore.firestore()
    
    // Initializers
    @Published var loggedIn : Bool = false
    @Published var loginFormShowing : Bool = false
    @Published var createUserFormShowing : Bool = false
    @Published var editUserInformation : Bool =  false
    
    @Published var email : String = ""
    @Published var name : String = ""
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
                self.name = document.get("name") as! String
            }
            else {
                
                // error
            }
        }
    }
    
    // MARK: - Save First Name
    func saveFirstName() {
        
        if let currentUser = Auth.auth().currentUser {
            let cleansedFirtName = self.name.trimmingCharacters(in: .whitespacesAndNewlines)
            
            let path = db.collection("users").document(currentUser.uid)
            
            path.setData(["name":cleansedFirtName]) {error in
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
    
}
