//
//  NavigationBar.swift
//  Rotty
//
//  Created by Rostislav Brož on 10/27/22.
//

import SwiftUI

struct NavigationBar: View {
    
    @EnvironmentObject var model: ContentModel
    
    @State var hasScrolled: Bool = false
    
    var body: some View {
        ZStack {
             Color.clear
                 .background(.ultraThinMaterial)
                 .opacity(hasScrolled ? 1 : 0)
             
             Text("Rotty")
                 .animatableFont(size: hasScrolled ? 22 : 34, weight: .bold, design: .default)
                 .frame(maxWidth: .infinity, alignment: .leading)
                 .padding(.leading, 20.0)
                 .padding(.top, 20)
                 .offset(y: hasScrolled ? -4 : 0)
                 .foregroundStyle(.linearGradient(colors: [.primary, .primary.opacity(0.7)], startPoint: .bottomLeading, endPoint: .topTrailing))
             
             HStack {
                 Button(action: {
                         model.showingAccountView = true
                     }, label: {
                         Image(systemName: "person.circle")
                             .foregroundColor(Color("AccentColor"))
                             .font(.body.weight(.bold))
                             .frame(width: 30, height: 30)
                             .cornerRadius(10)
                             .padding(8)
                             .background(.thinMaterial, in:
                                 RoundedRectangle(cornerRadius: 18, style: .continuous)
                             )
                     }).sheet(isPresented: $model.showingAccountView) {AccountView()}
             }.frame(maxWidth: .infinity, alignment: .trailing)
                 .padding(.trailing, 20)
                 .padding(.top, 20)
                 .offset(y: hasScrolled ? -4 : 0)
         }.frame(height: hasScrolled ? 44 : 70)
             .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
            .environmentObject(ContentModel())
    }
}
