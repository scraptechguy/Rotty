//
//  ListsView.swift
//  Rotty
//
//  Created by Rostislav Brož on 12/3/22.
//

import SwiftUI

struct ListsView: View {
    
    @State var shoppingList: [String] = ["Kinder maxi king", "Kinder bueno", "Tiger", "Bagetka sunka syr", "Kysele rybicky"]
    @State var shoppingListDone: [Bool] = Array(repeating: false, count: 5)
    @State var completed: [String] = ["Rohliky", "Mliko (tvuj otec se s nim vratil)", "Maslo", "Paprika", "Rajcata", "Panev", "Syr", "Sunka"]
    @State var completedDone: [Bool] = Array(repeating: true, count: 8)
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                Text("Shopping lists")
                    .foregroundColor(Color("Font"))
                    .font(.title.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                
                VStack {
                    ForEach(shoppingList.indices, id: \.self) { i in
                        ToDoItem(name: shoppingList[i], done: shoppingListDone[i])
                    }
                }.padding(.bottom)
                
                Text("Completed")
                    .foregroundColor(Color("Font"))
                    .font(.title.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                
                VStack {
                    ForEach(completed.indices, id: \.self) { i in
                        ToDoItem(name: completed[i], done: completedDone[i])
                    }
                }.padding(.bottom)
            }
        }
    }
}

struct ListsView_Previews: PreviewProvider {
    static var previews: some View {
        ListsView()
    }
}
