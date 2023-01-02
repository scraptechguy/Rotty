//
//  ListsView.swift
//  Rotty
//
//  Created by Rostislav Brož on 12/3/22.
//

import SwiftUI
import CoreData

struct ListsView: View {

    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var food: FetchedResults<Food>
    
    @State private var showingAddView = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                List {
                    ForEach(food) { food in
                        NavigationLink(destination: EditFoodView(food: food)) {
                            HStack {
                                VStack(alignment: .leading, spacing: 6) {
                                    Text(food.name!)
                                        .bold()
                                    
                                    Text("Expires in  ").foregroundColor(.secondary) + Text("\(Int(food.expiration)) days")
                                }
                                
                                Spacer()
                                
                                Text(calculateTimeSince(date: food.date!))
                                    .foregroundColor(.secondary)
                                    .italic()
                            }
                        }
                    }.onDelete(perform: deleteFood)
                }.listStyle(.plain)
            }.navigationTitle("Rotty")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            showingAddView.toggle()
                        }, label: {
                            Label("Add Food", systemImage: "plus.circle")
                        })
                    }
                    
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                    }
                }
                .sheet(isPresented: $showingAddView) {
                    AddFoodView()
                }
        }
    }
    
    private func deleteFood(offsets: IndexSet) {
        
        withAnimation {
            offsets.map { food[$0] }.forEach(managedObjContext.delete)
            
            DataController().save(context: managedObjContext)
        }
        
    }
    
}

struct ListsView_Previews: PreviewProvider {
    static var previews: some View {
        ListsView()
    }
}
