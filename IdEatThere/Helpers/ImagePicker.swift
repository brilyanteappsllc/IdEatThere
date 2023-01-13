//
//  File.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/12/23.
//

import Foundation
import UIKit

import SwiftUI


struct ImagePicker: UIViewControllerRepresentable {
    
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var userManager : UserManagerModel
    
    @Binding var selectedImage : UIImage?
    
    var source : UIImagePickerController.SourceType
    
    func makeUIViewController(context: Context) -> some UIViewController {
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = source
        imagePicker.delegate = context.coordinator
        
        return imagePicker
        
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    
}

class Coordinator : NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var parent: ImagePicker
    
    
    init(_ picker: ImagePicker) {
        self.parent = picker
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("image selected")
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
            DispatchQueue.main.async {
                self.parent.selectedImage = image
                self.parent.userManager.photo = self.parent.selectedImage
            }
            
        }
        
        
        
        // dismiss the picker
        parent.dismiss()
        parent.dismiss.callAsFunction()
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // run code when user cancelled
        print("cancelled")
        
        parent.dismiss()
        parent.dismiss.callAsFunction()
    }
    
    
    
    
}
