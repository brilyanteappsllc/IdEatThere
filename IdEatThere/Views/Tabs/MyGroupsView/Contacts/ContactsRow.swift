//
//  ContactsRow.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 2/12/23.
//

import SwiftUI

struct ContactsRow: View {
    
    var user: User
    
    var body: some View {
        
        // Create URL From the photo url
        let photoURL = URL(string: user.photo ?? "")
        
        
        HStack (spacing: 20){
            // Profile Image
            ZStack{
                
                
                AsyncImage(url: photoURL) { phase in
                    
                    switch phase {
                        
                    case .empty :
                        
                        ZStack {
                            Circle()
                                .foregroundColor(.white)
                            
                            Text(user.firstName?.prefix(1) ?? "")
                                .bold()
                        }
                    case .success(let image):
                        
                        //Display the fetched image
                        image
                            .resizable()
                            .scaledToFit()
                        
                    case .failure (let error):
                        // Couldn't fetch photo url
                        // Display a cirlce with first letter of first name
                        
                        ZStack {
                            Circle()
                                .foregroundColor(.white)
                            
                            Text(user.firstName?.prefix(1) ?? "")
                                .bold()
                        }
                    }
                }
                .frame(width: 44, height: 44)
                
                
                Circle()
                    .stroke(Color.theme.red, lineWidth: 2)
                    .frame(width: 44, height: 44)
            }
            
            
            VStack (alignment: .leading, spacing: 4) {
                // Name
                Text("\(user.firstName ?? "") \(user.lastName ?? "")")
                 //   .font(Font.bodyFont)
                    .bold()
                
                
                // Phone Number
                Text("\(user.phone ?? "")")
                 //   .font(Font.bodyFont)
                    .foregroundColor(Color.theme.groupButtonColor)
            }
            
            Spacer()
        }
    }
}

struct ContactsRow_Previews: PreviewProvider {
    static var previews: some View {
        ContactsRow(user: User())
    }
}
