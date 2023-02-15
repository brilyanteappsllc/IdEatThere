//
//  EmailView.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 2/15/23.
//

import SwiftUI
import ActionButton

enum FocusableField: Hashable {
    
    case email, password
}

struct EmailView: View {
    @StateObject private var model = ViewModel()
    @FocusState private var focus: FocusableField?
    @EnvironmentObject var userModel : UserManagerModel
    
    var body: some View {
        
        GroupBox {
            VStack(spacing: 30) {
                
                Text("SplashScreen")
                
    //            Image("login")
    //                .resizable()
    //                .scaledToFit()
                
                TextField("Email", text: $userModel.email)
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
                    .submitLabel(.next)
                    .focused($focus, equals: .email)
                    .onSubmit {
                        focus = .password
                    }
                
                SecureField("Password", text: $userModel.password)
                
//                ActionButton(state: $model.buttonState, onTap: {
//
//
//                }, backgroundColor: .primary)
                
                
                
            }
            .padding(.horizontal)
        }
    label: {
        Label("Welcome back!", systemImage: "hand.wave.fill")
        
    }
    .padding()
    .textFieldStyle(.plain)
        
        
    }
}

class ViewModel: ObservableObject {
    
    @Published var buttonState: ActionButtonState = .disabled(title: "Fill out all fields to login!", systemImage: "exclamationmark.circle")
    
}

struct EmailView_Previews: PreviewProvider {
    static var previews: some View {
        EmailView()
    }
}
