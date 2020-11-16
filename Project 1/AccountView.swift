//
//  AccountView.swift
//  Project 1
//
//  Created by Samuel Mendheim on 11/6/20.
//

import SwiftUI

struct AccountView: View {
    
    @ObservedObject var userInfo: UserInfo
    
    @State var username: String = ""
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var birthDate: Date
    
    
    @State var showingAlert = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Username: ")
                TextField("...", text: $username)
            }
            HStack {
                Text("First Name: ")
                TextField("...", text: $firstName)
            }
            HStack {
                Text("Last Name: ")
                TextField("...", text: $lastName)
            }
            HStack {
                Text("Email: ")
                TextField("...", text: $email)
            }
            HStack {
                DatePicker(selection: $birthDate, in: ...Date(), displayedComponents: .date) {
                    Text("Enter birthdate: ")
                }
            }.padding(.all)
            
            Button(action: {
                if username != "..." {
                    userInfo.username = username
                }
                if firstName != "..." {
                    userInfo.firstName = firstName
                }
                if lastName != "..." {
                    userInfo.lastName = lastName
                }
                if email != "..." {
                    userInfo.email = email
                }
                userInfo.dateOfBirth = birthDate
                
                self.showingAlert = true
            }) {
                Text("Save Changes")
            }.alert(isPresented: $showingAlert) {
                Alert(title: Text("Information"), message: Text("Changes Successful"), dismissButton: .default(Text("Coolio!")))
            }
        }
    }
}
