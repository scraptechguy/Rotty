//
//  EditFoodView.swift
//  Rotty
//
//  Created by Rostislav Brož on 1/2/23.
//

import SwiftUI

struct EditFoodView: View {
    
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    var food: FetchedResults<Food>.Element
    
    @State private var name = ""
    @State private var expiration: Double = 0
    
    var body: some View {
        Form {
            Section {
                TextField("\(food.name!)", text: $name)
                    .onAppear {
                        name = food.name!
                        expiration = food.expiration
                    }
                
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
                        DataController().editFood(food: food, name: name, expiration: expiration, context: managedObjContext)
                        
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
