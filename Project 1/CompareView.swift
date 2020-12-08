//
//  CompareView.swift
//  Project 1
//
//  Created by Samuel Mendheim on 11/5/20.
//
// The only Cost of Living API that could be found was Numbeo and that
// was not a free api. This led to us having to find a new method of comparing two
// salaries.
//

import SwiftUI


struct CompareView: View {
    @ObservedObject var userInfo: UserInfo
    
    @State var currentSalary: String = ""
    @State var filingStatus: String = "Single"
    @State var numExemptions: String = "1"
    @State var state: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Text("Current Annual Salary:")
                TextField("\(userInfo.currentFinancialData.annualSalary)", text: self.$currentSalary).keyboardType(.decimalPad).onTapGesture {
                    userInfo.currentFinancialData.annualSalary = Double(self.currentSalary) ?? 0.0
                }
            }
            HStack {
                Text("Current State of Residence (Abbrev.):")
                TextField(self.state, text: self.$state)
            }
            
        }
        
    }
}







//Old code for pulling from tax api

//Button(action: {
//    guard let url = URL(string: "https://taxee.io/api/v2/calculate/2020"), let payload = "state=\(self.state)&filing_status=\(filingStatus)&pay_periods=26&pay_rate=\(currentSalary)&exemptions=\(numExemptions)".data(using: .utf8) else {
//        return
//    }
//    var request = URLRequest(url: url)
//    request.httpMethod = "POST"
//    request.addValue("eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJBUElfS0VZX01BTkFHRVIiLCJodHRwOi8vdGF4ZWUuaW8vdXNlcl9pZCI6IjVmYTg0OTdmY2MzY2NlMWU0M2UxZmViYyIsImh0dHA6Ly90YXhlZS5pby9zY29wZXMiOlsiYXBpIl0sImlhdCI6MTYwNDg2NDM4M30.3ZowUcHTTYRYpjnikJ5XUVwngVoRTcjIsXYQfl0TI2g", forHTTPHeaderField: "Authorization: Bearer")
//    request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
//    request.httpBody = payload
//
//    URLSession.shared.dataTask(with: request) { (data, response, error) in
//        guard error == nil else { print(error!.localizedDescription); return }
//        guard let data = data else { print("Empty data"); return }
//
//        if let str = String(data: data, encoding: .utf8) {
//            print(str)
//        }
//    }.resume()
//
//
//}) {
//    Text("Calculate Taxes")
//}
