//
//  UserInfo.swift
//  Project 1
//
//  Created by Samuel Mendheim on 10/27/20.
//

import Foundation



class UserInfo: ObservableObject, Identifiable {
    
    @Published var id: String
    @Published var username: String
    @Published var firstName: String
    @Published var lastName: String
    @Published var email: String
    @Published var password: String
    @Published var dateOfBirth: Date
    
    @Published var currentFinancialData: FinancialData

    
    
    init(username: String, firstName: String, lastName: String, email: String, password: String,
         currentFinancialData: FinancialData, dateOfBirth: Date) {
        
        self.id = UUID().uuidString
        self.username = username
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password
        self.dateOfBirth = dateOfBirth
        self.currentFinancialData = currentFinancialData
    }
}

