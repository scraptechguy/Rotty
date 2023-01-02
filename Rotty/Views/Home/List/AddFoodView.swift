//
//  AddFoodView.swift
//  Rotty
//
//  Created by Rostislav Brož on 1/2/23.
//

import SwiftUI

struct AddFoodView: View {
    
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var expiration: Double = 7
    
    var body: some View {
        Form {
            Section {
                TextField("Name of your food", text: $name)
                
                VStack {
                    if expiration == 1 {
                        Text("The food expires in \(Int(expiration)) day")
                    } else {
                        Text("The food expires in \(Int(expiration)) days")
                    }
                    
                    Slider(value: $expiration, in: 1...30)
                }
                
                HStack {
                    Spacer()
                    
                    Button(action: {
                        DataController().addFood(name: name, expiration: expiration, context: managedObjContext)
                        
                        dismiss() 
                    }, label: {
                        Text("Submit")
                            .bold()
                    })
                    
                    Spacer()
                }
            }
        }
    }
}

struct AddFoodView_Previews: PreviewProvider {
    static var previews: some View {
        AddFoodView()
    }
}
