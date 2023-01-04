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
    
    @EnvironmentObject var model: ContentModel
    
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
                                    
                                    Text("Expires in ").foregroundColor(model.isHighContrast ? .primary : .secondary).fontWeight(model.fontIsBold ? .bold : .regular) + Text("\(Int(food.expiration)) days").fontWeight(model.fontIsBold ? .bold : .regular)
                                }
                                
                                Spacer()
                                
                                Text(calculateTimeSince(date: food.date!))
                                    .foregroundColor(model.isHighContrast ? .primary : .secondary)
                                    .italic()
                                    .fontWeight(model.fontIsBold ? .bold : .regular)
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
                                .fontWeight(model.fontIsBold ? .bold : .regular)
                        })
                    }
                    
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                            .fontWeight(model.fontIsBold ? .bold : .regular)
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
            .environmentObject(ContentModel())
    }
}
