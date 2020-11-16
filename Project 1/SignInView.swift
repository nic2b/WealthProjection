//
//  SignInView.swift
//  Project 1
//
//  Created by Samuel Mendheim on 10/27/20.
//

import SwiftUI

struct SignInView: View {
    @ObservedObject var user: UserInfo
    
    var body: some View {
        VStack {
            HStack {
                Text("Username: ")
                TextField("...", text: self.$user.username)
            }
            HStack {
                Text("Email: ")
                TextField("...", text: self.$user.email)
            }
            HStack {
                Text("Password: ")
                TextField("...", text: self.$user.password)
            }
        }
    }
}
