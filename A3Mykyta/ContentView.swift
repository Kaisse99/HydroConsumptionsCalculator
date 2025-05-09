// 991701116
// Mykyta Varnikov

import SwiftUI

struct ContentView: View {
    // user input variables
    @State var onPeakUse : Double?
    @State var offPeakUse: Double?
    @State var midPeakUse: Double?
    
    // rates
    private let onPeakRate: Double = 0.132
    private let offPeakRate: Double = 0.065
    private let midPeakRate: Double = 0.094
    private let hstRate: Double = 0.13
    private let rebateRate = 0.08
    
    // computed properties
    var onPeakCharge: Double {
        (onPeakUse ?? 0.0) * onPeakRate
    }
    var offPeakCharge: Double {
        (offPeakUse ?? 0.0) * offPeakRate
    }
    var midPeakCharge: Double {
        (midPeakUse ?? 0.0) * midPeakRate
    }
    
    var totalCharges: Double {
        onPeakCharge + offPeakCharge + midPeakCharge
    }
    var hstCharge: Double {
        totalCharges * hstRate
    }
    var rebateCharge: Double {
        totalCharges * rebateRate
    }
    var totalRegulatoryCharge: Double {
        hstCharge - rebateCharge
    }
    var totalBill: Double {
        totalCharges + totalRegulatoryCharge
    }
    
    // to format user input
    let formatter : NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    var body: some View {
        NavigationView {
            Form {
                //User input
                Section(header: Text("Usage Details")) {
                    TextField("Enter On-Peak usage in kWh", value: $onPeakUse, formatter: formatter ).keyboardType(.decimalPad)
                    TextField("Enter Off-Peak usage in kWh", value: $offPeakUse, formatter: formatter).keyboardType(.decimalPad)
                    TextField("Enter Mid-Peak usage in kWh", value: $midPeakUse, formatter: formatter).keyboardType(.decimalPad)
                }
                
                
                Section(header: Text("Consumption Charges")){
                    Text("On-Peak Charges: $\(onPeakCharge, specifier: "%.2f")")
                    Text("Off-Peak Charges: $\(offPeakCharge, specifier: "%.2f")")
                    Text("Mid-Peak Charges: $\(midPeakCharge, specifier: "%.2f")")
                    Text("Total Consumption Charges: $\(totalCharges, specifier: "%.2f")").foregroundColor(.teal).bold()
                }
                Section(header: Text("Regulatory Charges")){
                    Text("HST (13%): $\(hstCharge, specifier: "%.2f")")
                    Text("Provincial Rebate (8%): $\(rebateCharge, specifier: "%.2f")")
                    Text("Total Regulatory Charges: $\(totalRegulatoryCharge, specifier: "%.2f")").foregroundColor(.teal).bold()
                }
                
                Section(header: Text("Bill amount")){
                    Text("Net Bill Amount: $\(totalBill, specifier: "%.2f")").foregroundColor(.red).bold()
                }
            }
            .navigationTitle("Mykyta Varnikov").navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
