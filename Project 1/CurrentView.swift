//
//  CurrentView.swift
//  Project 1
//
//  Created by Samuel Mendheim on 11/5/20.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

struct CurrentView: View {
    @ObservedObject var userInfo: UserInfo
    
    @State var expandAsset = false
    @State var expandLiability = false
    
    @State var salary: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Net Worth: ").bold().font(.title)
                    Text("\(userInfo.currentFinancialData.calculateNetWorth(), specifier: "%.2f")").font(.title)
                }
                
                HStack {
                    Text("Assets").bold()
                    Spacer()
                    Text("Value: \(userInfo.currentFinancialData.getTotalAssets(), specifier: "%.2f")")
                    Image(systemName: expandAsset ? "chevron.up" : "chevron.down")
                }.onTapGesture {
                    self.expandAsset.toggle()
                }.padding(.horizontal)
                if expandAsset {
                    List {
                        ForEach(userInfo.currentFinancialData.assets) { asset in
                            NavigationLink("\(asset.name) \(asset.value, specifier: "%.2f")",destination: AssetView())
                        }
                    }
                }
                
                HStack {
                    Text("Liabilities").bold()
                    Spacer()
                    Text("Amount: \(userInfo.currentFinancialData.getTotalLiability(), specifier: "%.2f")")
                    Image(systemName: expandLiability ? "chevron.up" : "chevron.down")
                }.onTapGesture {
                    self.expandLiability.toggle()
                }.padding(.horizontal)
                if expandLiability {
                    List {
                        ForEach(userInfo.currentFinancialData.liabilities) { liability in
                            NavigationLink("\(liability.name) \(liability.debtAmount, specifier: "%.2f")",destination: AssetView())
                        }
                    }
                }
                
                //User Information
                /*
                HStack {
                    Text("Annual Salary:")
                    TextField("\(userInfo.currentFinancialData.annualSalary)", text: self.$salary).keyboardType(.decimalPad).onTapGesture {
                        userInfo.currentFinancialData.annualSalary = Double(self.salary) ?? 0.0
                    }
                    
                }*/
            }
        }
    }
}
