//
//  CreateGroupsView.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/9/23.
//

import SwiftUI

struct CreateGroupsView: View {
    
    @EnvironmentObject var myGroupsModel : MyGroupsModel
    @Environment(\.dismiss) var dismiss
    
    @State var selectedImage : UIImage?
    @State var isPickerShowing : Bool = false
    @State var isSourceMenuShowing = false
    @State var source : UIImagePickerController.SourceType = .photoLibrary
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                // TODO: Add optional group photo
//                    Form {
//
//                        Section(header: Text("Add a Photo")) {
//
//                            Button {
//
//                                isSourceMenuShowing.toggle()
//
//                            } label: {
//
//                                ZStack {
//
//                                    if myGroupsModel.groupPhoto != nil {
//
//                                        Image(uiImage: myGroupsModel.groupPhoto!)
//                                            .resizable()
//                                            .scaledToFit()
//                                            .clipShape(Rectangle())
//
//                                    } else {
//                                        Circle()
//                                            .foregroundColor(.white)
//
//                                        Circle()
//                                            .stroke(Color.theme.red, lineWidth: 2)
//
//                                        Image(systemName: "camera.fill")
//                                            .foregroundColor(Color.theme.accent)
//
//                                    }
//                                }
//
//                            }
//
//
//                        }
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
             //       .scrollContentBackground(.hidden)
                
                Button {
                    myGroupsModel.createGroup(groupName: myGroupsModel.groupName, groupPhoto: myGroupsModel.groupPhoto, datePicked: myGroupsModel.datePicked, allowInvites: myGroupsModel.allowInvitesToGroup) { error in
                        
                        if error == nil {
                            
                            myGroupsModel.queryGroupsAttending()
                            myGroupsModel.queryGroupsHosting()
                            myGroupsModel.resetGroupDetailForm()
                            dismiss()
                            dismiss.callAsFunction()
                        }

                    }
                    
                } label: {
                    CreateGroupButton()
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
