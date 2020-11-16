//
//  ContentView.swift
//  Project 1
//
//  Created by Samuel Mendheim on 10/27/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var userInfo: UserInfo = UserInfo(username: "", firstName: "", lastName: "", email: "", password: "", currentFinancialData: FinancialData(assets: [Asset(name: "Computer", value: 1000.00), Asset(name: "House", value: 122000), Asset(name: "Car", value: 10000), FourOneKInfo(name: "401k", contributeAmount: 1000, currentFourOneKAmount: 12000, annualRateReturn: 1.07, employerMatch: 0, employerMatchEnd: 0), TraditionalIRAInfo(currentRothAmount: 15000, annualContribution: 1500, adjustedGrossIncome: 38000, annualRateOfReturn: 1.05, name: "Traditional IRA")], liabilities: [Liability(name: "College Debt", debtAmount: 20000), Liability(name: "New Boat", debtAmount: 12384)], annualSalary: 0.0), dateOfBirth: Date())
    
    var body: some View {
        TabView {
            CurrentView(userInfo: userInfo).tabItem {
                Image(systemName: "1.circle")
                Text("Current")
            }
            ProjectedView(userInfo: userInfo).tabItem {
                Image(systemName: "2.circle")
                Text("Projected")
            }
            /*
            CompareView(userInfo: userInfo).tabItem {
                Image(systemName: "3.circle")
                Text("Compare")
            }*/
            AccountView(userInfo: userInfo, birthDate: Date()).tabItem {
                Image(systemName: "4.circle")
                Text("Account")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
