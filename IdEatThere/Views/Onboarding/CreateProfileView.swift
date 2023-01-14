//
//  CreateProfileView.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/10/23.
//

import SwiftUI

struct CreateProfileView: View {
    
    @EnvironmentObject var userManager : UserManagerModel
    
    @State var selectedImage : UIImage?
    @State var isPickerShowing : Bool = false
    @State var isSourceMenuShowing = false
    @State var source : UIImagePickerController.SourceType = .photoLibrary
    
    var body: some View {
        
        VStack {
            
            Text("Set Up Profile")
                .bold()
                .font(.title)
                .padding(.top, 52)
            
            Text("Just a few more details to get started")
                .padding(.top, 12)
                .font(.body)
            
            // Profile Image Button
            Button {
                
                isSourceMenuShowing.toggle()
                
            } label: {
                
                ZStack {
                    
                    if selectedImage != nil {
                        
                        Image(uiImage: selectedImage!)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                        
                    } else {
                        Circle()
                            .foregroundColor(.white)
                        
                        Circle()
                            .stroke(Color.theme.red, lineWidth: 2)
                        
                        Image(systemName: "camera.fill")
                            .foregroundColor(Color.theme.accent)
                        
                    }
                }
                .frame(width: 134, height: 134)
                .padding(.top, 50)
                
            }

            TextField(" First Name ", text: $userManager.firstName)
                .textFieldStyle(OnboardingTextFields())
                .padding(.top, 50)
   
            TextField(" Last Name ", text: $userManager.lastName)
                .textFieldStyle(OnboardingTextFields())
                
            Spacer()

        }
        .padding(.horizontal)
        .confirmationDialog("From where?", isPresented: $isSourceMenuShowing, actions: {
            
            Button{
                // Set the source to photo libary
                // Show the image picker
                self.source = .photoLibrary
                isPickerShowing.toggle()
            } label: {
                Text("Photo Library")
                
            }
            
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                
                Button {
                    // Set the source to camera
                    self.source = .camera
                    
                    isPickerShowing.toggle()
                    
                } label : {
                    
                    Text("Take Photo")
                    
                }
            }
        })
        .sheet(isPresented: $isPickerShowing) {
            // Show the image picker
            ImagePicker(selectedImage: $selectedImage, source: source)
        }
    }
}

struct CreateProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProfileView()
            .environmentObject(UserManagerModel())
    }
}
