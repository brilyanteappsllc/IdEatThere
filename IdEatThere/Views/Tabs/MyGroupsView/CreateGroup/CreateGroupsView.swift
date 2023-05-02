//
//  CreateGroupsView.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/9/23.
//

import SwiftUI

struct CreateGroupsView: View {
    
    @EnvironmentObject var myGroupsModel : MyGroupsModel
    @EnvironmentObject var calendarEventModel : CalendarEventStoreViewModel
    @Environment(\.dismiss) var dismiss
    
    @State var selectedImage : UIImage?
    @State var isPickerShowing : Bool = false
    @State var isSourceMenuShowing = false
    @State var source : UIImagePickerController.SourceType = .photoLibrary
    @Binding var eventType : CalendarEventType
    
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
                        
                            
                            Section(header: Text("Event Type")) {
                                Picker("Select an event type", selection: $eventType) {
                                    ForEach(CalendarEventType.allCases, id: \.self) { type in
                                        Text("\(type.icon)   \(type.type)")
                                        
                                        
                                    }
                               
                                }
                                .pickerStyle(.menu)
//                              .onChange(of: eventType) { newValue in
//                                  print(newValue.rawValue)
//                              }
                                
                            }
                        
                        Section(header: Text("Pick your date")) {
                            DatePicker("Date", selection: $myGroupsModel.datePicked, displayedComponents: [.date, .hourAndMinute])
                            
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
                    myGroupsModel.createGroup(groupName: myGroupsModel.groupName, groupType: calendarEventModel.eventType.rawValue, groupPhoto: myGroupsModel.groupPhoto, datePicked: myGroupsModel.datePicked, allowInvites: myGroupsModel.allowInvitesToGroup) { error in
                        
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
        CreateGroupsView(eventType: .constant(.unspecified))
            .environmentObject(MyGroupsModel())
            .environmentObject(CalendarEventStoreViewModel())
    }
}
