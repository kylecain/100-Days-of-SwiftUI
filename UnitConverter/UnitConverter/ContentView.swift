//
//  ContentView.swift
//  UnitConverter
//
//  Created by Kyle Cain on 1/21/21.
//

import SwiftUI

struct ContentView: View {
    @State private var type = 0
    @State private var from = 0
    @State private var to = 0
    
    @State private var input = ""
    @State private var output = ""
    
    let typesArr = [Temperature.type, Length.type, Time.type, Volume.type]
    
    let unitsArr = [Temperature.units, Length.units, Time.units, Volume.units]
    
    var selectedUnits: [String] {
        return unitsArr[type]
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Unit Selction")) {
                    Picker("Units", selection: $type) {
                        ForEach(0 ..< typesArr.count) {
                            Text(self.typesArr[$0])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("From")) {
                    Picker("Units", selection: $from) {
                        ForEach(0 ..< selectedUnits.count, id: \.self) {
                            Text(self.selectedUnits[$0])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    TextField("Units to convert from", text: $input)
                        .keyboardType(.numberPad)
                }
                
                Section(header: Text("To")) {
                    Picker("Units", selection: $to) {
                        ForEach(0 ..< selectedUnits.count, id: \.self) {
                            Text(self.selectedUnits[$0])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    switch type {
                    case 0:
                        Text("I might have took too much on...")
                        // Text(Temperature.convert(from, to, input))
                    default:
                        Text("I should follow instructions")
                    }
                    
                }
            }
            .navigationTitle("Unit Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
