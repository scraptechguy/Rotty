//
//  ToDoItem.swift
//  Rotty
//
//  Created by Rostislav Brož on 12/5/22.
//

import SwiftUI

struct ToDoItem: View {
    
    @State var name: String
    @State var done: Bool
    
    var body: some View {
        ZStack {
            VStack {
                Divider()
                
                HStack {
                    Button(action: {
                        done.toggle()
                    }, label: {
                        Image(systemName: done ? "checkmark.circle.fill" : "checkmark.circle")
                    })
                    
                    Text(name)
                }.frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
            }
        }
    }
}

struct ToDoItem_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItem(name: "Kinder maxi king", done: false)
    }
}
