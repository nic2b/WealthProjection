//
//  ProjectedView.swift
//  Project 1
//
//  Created by Samuel Mendheim on 11/5/20.
//

import SwiftUI
import iLineChart

struct ProjectedView: View {
    
    @ObservedObject var userInfo: UserInfo
    
    var body: some View {
        let FOK: FourOneKInfo = userInfo.currentFinancialData.getAssetByName(name: "401k") as! FourOneKInfo
        let subtitleDescription: String = "Generated with starting value of \(FOK.currentFourOneKAmount), an annual contribution of \(FOK.contributeAmount), an annual rate of return of \(FOK.annualRateReturn), and a timeframe of 30 years"
        
        let TIRA: TraditionalIRAInfo = userInfo.currentFinancialData.getAssetByName(name: "Traditional IRA") as! TraditionalIRAInfo
        let IRAsub: String = "Generated with staritng value of \(TIRA.currentRothAmount), an annual contribution of \(TIRA.annualContribution), an annual rate of return of \(TIRA.annualRateOfReturn), and a timeframe of 25 years"
        
        let mainSreenWidth = UIScreen.main.bounds.size.width
        let mainScreenHeight = UIScreen.main.bounds.size.height
        
        iLineChart(data: FOK.generateGraphProjection(numYears: 30), title: FOK.name, subtitle:  subtitleDescription, displayChartStats: true).border(Color.black, width: 1.5).cornerRadius(10).padding(.all)
        /*
        VStack {
            
            iLineChart(data: TIRA.generateGraphProjection(numYears: 25), title: TIRA.name, subtitle:  IRAsub, displayChartStats: true).border(Color.black, width: 1.5).cornerRadius(10).padding(.all)
        }

        
        ScrollView {
            VStack {
                iLineChart(data: FOK.generateGraphProjection(numYears: 30), title: FOK.name, subtitle:  subtitleDescription, displayChartStats: true).border(Color.black, width: 1.5).cornerRadius(10).padding(.all)
            }.frame(width: mainSreenWidth, height: mainScreenHeight, alignment: .center)
            VStack {
                iLineChart(data: TIRA.generateGraphProjection(numYears: 25), title: TIRA.name, subtitle:  IRAsub, displayChartStats: true).border(Color.black, width: 1.5).cornerRadius(10).padding(.all)
            }.frame(width: mainSreenWidth, height: mainScreenHeight, alignment: .center)
        }*/



    }
    
    /*
    @ObservedObject var userInfo: UserInfo
    
    var body: some View {
        VStack {
            var lineChart = LineChartView()
            
            lineChart.data = FOK.generateGraphProjection(startingAge: 30, endingAge: 60)
        }
    }
 */
}

