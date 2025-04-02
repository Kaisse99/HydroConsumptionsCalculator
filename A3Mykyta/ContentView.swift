//
//  ContentView.swift
//  A3Mykyta
//
//  Created by Mykyta Kaisenberg on 2025-04-01.
//

import SwiftUI

struct ContentView: View {
    @State var onPeakUse : Double?
    @State var offPeakUse: Double?
    @State var midPeakUse: Double?
    
    let formatter : NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        return formatter
    }()    
    var body: some View {
        Text("Mykyta Varnikov").bold()
        
        Section(header: Text("Usage Details")) {
            TextField("Enter On-Peak usage in kWh", value: $onPeakUse, formatter: formatter ).keyboardType(.decimalPad)
            TextField("Enter Off-Peak usage in kWh", value: $offPeakUse, formatter: formatter).keyboardType(.decimalPad)
            TextField("Enter Mid-Peak usage in kWh", value: $midPeakUse, formatter: formatter).keyboardType(.decimalPad)
        }
        Section(header: Text("Consumption Charges")){
            Text("On-Peak Charges: ")
            Text("Off-Peak Charges: ")
            Text("Mid-Peak Charges: ")
            Text("Total Consumption Charges: ")
        }
        Section(header: Text("Regulatory Charges")){
            Text("HST (13%): ")
            Text("Provincial Rebate (8%): ")
            Text("Total Regulatory Charges: ")
        }
        
        Section(header: Text("Bill amount")){
            Text("Net Bill Amount: ")
        }
    }
}

#Preview {
    ContentView()
}
