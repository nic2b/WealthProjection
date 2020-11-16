//
//  FinancialData.swift
//  Project 1
//
//  Created by Samuel Mendheim on 11/6/20.
//

import Foundation
import Charts

class FinancialData: ObservableObject, Identifiable {
    
    @Published var id: String
    @Published var assets: [Asset]
    @Published var liabilities: [Liability]
    
    @Published var annualSalary: Double
    
    
    init (assets: [Asset],
          liabilities: [Liability], annualSalary: Double) {
        self.id = UUID().uuidString
        self.assets = assets
        self.liabilities = liabilities
        self.annualSalary = annualSalary
    }
    
    func getAssetByName(name: String) -> Asset {
        for asset in assets {
            if asset.name == name {
                return asset
            }
        }
        return Asset(name: "Null", value:  0.0)
    }
    
    func calculateNetWorth() -> Double {
        return getTotalAssets() - getTotalLiability()
    }
    
    func getTotalAssets() -> Double {
        var currentAmount: Double = 0
        for asset in assets {
            currentAmount += asset.value
        }
        return currentAmount
    }
    
    func getTotalLiability() -> Double {
        var currentAmount: Double = 0
        for liability in liabilities {
            currentAmount += liability.debtAmount
        }
        return currentAmount
    }
}


class Asset: ObservableObject, Identifiable {
    
    @Published var name: String
    @Published var value: Double
    
    init(name: String, value: Double) {
        self.name = name
        self.value = value
    }
}

class InvestmentsInfo: Asset {
    
}

class Liability: ObservableObject, Identifiable {
    @Published var name: String
    @Published var debtAmount: Double
    
    
    init(name: String, debtAmount: Double) {
        self.name = name
        self.debtAmount = debtAmount
    }
}


class FourOneKInfo: InvestmentsInfo {
    
    @Published var contributeAmount: Double
    
    @Published var currentFourOneKAmount: Double
    @Published var annualRateReturn: Double
    
    @Published var employerMatch: Double
    @Published var employerMatchEnd: Double
    
    init(name: String, contributeAmount: Double, currentFourOneKAmount: Double,
         annualRateReturn: Double, employerMatch: Double,
         employerMatchEnd: Double) {
        
        self.contributeAmount = contributeAmount
        self.currentFourOneKAmount = currentFourOneKAmount
        self.annualRateReturn = annualRateReturn
        self.employerMatch = employerMatch
        self.employerMatchEnd = employerMatchEnd
        
        super.init(name: name, value: currentFourOneKAmount)
    }
    
    func generateGraphProjection(numYears: Int) -> [Double] {

        var currFKAmount: Double = currentFourOneKAmount
        var values: [Double] = []
        for _ in 0...numYears {
            currFKAmount += contributeAmount
            currFKAmount *= annualRateReturn
            values.append(currFKAmount)
        }
        return values
    }
}

class TraditionalIRAInfo: InvestmentsInfo {
    @Published var currentRothAmount: Double
    @Published var annualContribution: Double
    @Published var adjustedGrossIncome: Double
    @Published var annualRateOfReturn: Double
    
    init(currentRothAmount: Double, annualContribution: Double, adjustedGrossIncome: Double, annualRateOfReturn: Double, name: String) {
        
        self.currentRothAmount = currentRothAmount
        self.annualContribution = annualContribution
        self.adjustedGrossIncome = adjustedGrossIncome
        self.annualRateOfReturn = annualRateOfReturn
        
        super.init(name: name, value: currentRothAmount)
    }
    
    func generateGraphProjection(numYears: Int) -> [Double] {

        var currIRAamount: Double = currentRothAmount
        var values: [Double] = []
        for _ in 0...numYears {
            currIRAamount += annualContribution
            currIRAamount *= annualRateOfReturn
            values.append(currIRAamount)
        }
        return values
    }
}
/*
class RothIRAInfo: InvestmentsInfo {
    
    @Published var currentRothIRAAmount: Double
    @Published var annualContribution: Double
    @Published var expectedRateOfReturn: Double
    @Published var marginalTaxRate: Double
    
    init(currentRothIRAAmount: Double, annualContribution: Double,
         expectedRateOfReturn: Double, marginalTaxRate: Double) {
        self.currentRothIRAAmount = currentRothIRAAmount
        self.annualContribution = annualContribution
        self.expectedRateOfReturn = expectedRateOfReturn
        self.marginalTaxRate = marginalTaxRate
        
        super.init(value: currentRothIRAAmount)
    }
    
}
*/

