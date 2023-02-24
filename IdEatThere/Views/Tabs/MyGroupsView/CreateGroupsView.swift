//
//  CreateGroupsView.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/9/23.
//

import SwiftUI

struct CreateGroupsView: View {
    
    @EnvironmentObject var myGroupsModel : MyGroupsModel
    
    @State var selectedImage : UIImage?
    @State var isPickerShowing : Bool = false
    @State var isSourceMenuShowing = false
    @State var source : UIImagePickerController.SourceType = .photoLibrary
    
    var body: some View {
        
        NavigationView {
            
     
                
                Form {
                    
                    Section(header: Text("Group Name")) {
                        TextField(myGroupsModel.groupName.isEmpty ? "Taco Party.." : myGroupsModel.groupName, text: $myGroupsModel.groupName)
                        
                        
                    }
                    
                    Section(header: Text("Pick your date")) {
                        DatePicker("Reservations on: ", selection: $myGroupsModel.datePicked, displayedComponents: .date)
                        
                    }
                    
                    Section(header: Text("Permissions")) {
                        
                        Toggle("Allow others to invite?", isOn: $myGroupsModel.allowInvitesToGroup)
                            .toggleStyle(SwitchToggleStyle(tint: Color.theme.accent))
                    }
                    
                    Section(header: Text("Group Photo")) {
                        
                        
                        
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        HStack {
                            // TODO: User selects Image
                            Image(systemName: "fork.knife.circle.fill")
                                .font(.system(size: 25))
                            Text("Group Details")
                                .font(.system(size: 30))
                                .font(Font.headingFont)
                        }
                        .padding(.top, 10)
                    }
                }

            
        }
    }
    
}

struct CreateGroupsView_Previews: PreviewProvider {
    static var previews: some View {
        CreateGroupsView()
            .environmentObject(MyGroupsModel())
    }
}
