//
//  PhoneVerficationView.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/10/23.
//

import SwiftUI

struct PhoneVerficationView: View {
    
    @EnvironmentObject var userManager : UserManagerModel
    
    enum FocusedField {
        case int1, int2, int3, int4, int5, int6
    }
    
    @FocusState private var focusedField : FocusedField?
    
    @State private var text1 = ""
    @State private var text2 = ""
    @State private var text3 = ""
    @State private var text4 = ""
    @State private var text5 = ""
    @State private var text6 = ""
    
    @State private var codeValid = false
    
    
    var body: some View {
        
        VStack {
          
            Text("Verification")
                .bold()
                .font(.title)
                .padding(.top, 52)
            
            Text("Enter the 6-digit verification code we sent to your device")
                .padding(.top, 12)
                .font(.body)
            
            
            HStack {
                Spacer()
                TextField("", text: $text1)
                    .textFieldStyle(VerificationCodeTextField())
                    .keyboardType(.numberPad)
                    .focused($focusedField, equals: .int1)
                    .opacity(codeValid ? 0 : 1)

                TextField("", text: $text2)
                    .textFieldStyle(VerificationCodeTextField())
                    .keyboardType(.numberPad)
                    .focused($focusedField, equals: .int2)
                    .opacity(codeValid ? 0 : 1)

                TextField("", text: $text3)
                    .textFieldStyle(VerificationCodeTextField())
                    .keyboardType(.numberPad)
                    .focused($focusedField, equals: .int3)
                    .opacity(codeValid ? 0 : 1)

                TextField("", text: $text4)
                    .textFieldStyle(VerificationCodeTextField())
                    .keyboardType(.numberPad)
                    .focused($focusedField, equals: .int4)
                    .opacity(codeValid ? 0 : 1)

                TextField("", text: $text5)
                    .textFieldStyle(VerificationCodeTextField())
                    .keyboardType(.numberPad)
                    .focused($focusedField, equals: .int5)
                    .opacity(codeValid ? 0 : 1)

                TextField("", text: $text6.max(1))
                    .textFieldStyle(VerificationCodeTextField())
                    .keyboardType(.numberPad)
                    .focused($focusedField, equals: .int6)
                    .opacity(codeValid ? 0 : 1)
                Spacer()
            }
                if userManager.errorMessage != nil {
                    Section {
                        Text(userManager.errorMessage!)
                    }
                }
            Spacer()
        }
        .padding(.horizontal)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                focusedField = .int1
            }
        }
        .onChange(of: text1) { _ in
            focusedField = .int2
            userManager.verificationCode = text1
        }
        .onChange(of: text2) { _ in
            focusedField = .int3
            userManager.verificationCode += text2
        }
        .onChange(of: text3) { _ in
            focusedField = .int4
            userManager.verificationCode += text3
        }
        .onChange(of: text4) { _ in
            focusedField = .int5
            userManager.verificationCode += text4
        }
        .onChange(of: text5) { _ in
            focusedField = .int6
            userManager.verificationCode += text5
        }
        .onChange(of: text6) { _ in
            focusedField = nil
            userManager.verificationCode += text6
        }
    }
}

struct PhoneVerficationView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneVerficationView()
            .environmentObject(UserManagerModel())
    }
}
