//
//  AddListView.swift
//  Rotty
//
//  Created by Rostislav Brož on 1/10/23.
//

import SwiftUI
import AVFoundation

struct AddListView: View {
    
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var model: ContentModel
    
    @State private var name = ""
    @State private var foodName = ""
    @State private var icon = "bag"
    @State private var expiration: Double = 7
    @State private var selection = "manually"
    
    var body: some View {
        NavigationView {
            VStack {
                if selection == "camera" {
                    ZStack {
                        CameraPreview()
                            .onAppear(perform: {
                                model.checkAuthorization()
                                
                                DispatchQueue.global(qos: .background).async {
                                    model.session.startRunning()
                                }
                            })
                            .onDisappear(perform: {
                                model.isTaken = false
                                
                                DispatchQueue.global(qos: .background).async {
                                    model.session.stopRunning()
                                }
                            })
                        
                        VStack {
                            Spacer()
                            
                            HStack {
                                if !model.isTaken {

                                    Button(action: {
                                        model.takePic()
                                    }, label: {
                                        ZStack {
                                            Circle()
                                                .fill(Color.white)
                                                .frame(width: 65, height: 65)
                                            
                                            Circle()
                                                .stroke(Color.white, lineWidth: 2)
                                                .frame(width: 75, height: 75)
                                        }
                                    }).padding(.bottom)
                                        .padding(.bottom)
                                    
                                }
                            }.frame(height: 75)
                        }
                    }
                } else {
                    Form {
                        Section(header: Text("List").fontWeight(model.fontIsBold ? .bold : .regular).foregroundColor(model.isHighContrast ? .primary : .secondary)) {
                            HStack {
                                Image(systemName: icon)
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(Color("AccentColor"))
                                    .frame(width: 30, height: 40)
                                    .padding()
                                
                                TextField(text: $name) {
                                    Text("Name of the list")
                                        .font(.title3)
                                        .foregroundColor(model.isHighContrast ? .primary : .secondary)
                                }
                            }.fontWeight(model.fontIsBold ? .bold : .regular)
                        }
                        
                        Section {
                            ScrollView(.horizontal) {
                                HStack(spacing: 18) {
                                    Button(action: {
                                        icon = "bag"
                                    }, label: {
                                        if icon == "bag" {
                                            
                                            Image(systemName: "bag")
                                                .fontWeight(model.fontIsBold ? .bold : .regular)
                                                .foregroundColor(Color("AccentColor"))
                                            
                                        } else {
                                            
                                            Image(systemName: "bag")
                                                .fontWeight(model.fontIsBold ? .bold : .regular)
                                                .foregroundColor(model.isHighContrast ? .primary : .secondary)
                                            
                                        }
                                    })
                                    
                                    Button(action: {
                                        icon = "cart"
                                    }, label: {
                                        if icon == "cart" {
                                            
                                            Image(systemName: "cart")
                                                .fontWeight(model.fontIsBold ? .bold : .regular)
                                                .foregroundColor(Color("AccentColor"))
                                            
                                        } else {
                                            
                                            Image(systemName: "cart")
                                                .fontWeight(model.fontIsBold ? .bold : .regular)
                                                .foregroundColor(model.isHighContrast ? .primary : .secondary)
                                            
                                        }
                                    })
                                    
                                    Button(action: {
                                        icon = "basket"
                                    }, label: {
                                        if icon == "basket" {
                                            
                                            Image(systemName: "basket")
                                                .fontWeight(model.fontIsBold ? .bold : .regular)
                                                .foregroundColor(Color("AccentColor"))
                                            
                                        } else {
                                            
                                            Image(systemName: "basket")
                                                .fontWeight(model.fontIsBold ? .bold : .regular)
                                                .foregroundColor(model.isHighContrast ? .primary : .secondary)
                                            
                                        }
                                    })
                                    
                                    Button(action: {
                                        icon = "fish"
                                    }, label: {
                                        if icon == "fish" {
                                            
                                            Image(systemName: "fish")
                                                .fontWeight(model.fontIsBold ? .bold : .regular)
                                                .foregroundColor(Color("AccentColor"))
                                            
                                        } else {
                                            
                                            Image(systemName: "fish")
                                                .fontWeight(model.fontIsBold ? .bold : .regular)
                                                .foregroundColor(model.isHighContrast ? .primary : .secondary)
                                            
                                        }
                                    })
                                    
                                    Button(action: {
                                        icon = "carrot"
                                    }, label: {
                                        if icon == "carrot" {
                                            
                                            Image(systemName: "carrot")
                                                .fontWeight(model.fontIsBold ? .bold : .regular)
                                                .foregroundColor(Color("AccentColor"))
                                            
                                        } else {
                                            
                                            Image(systemName: "carrot")
                                                .fontWeight(model.fontIsBold ? .bold : .regular)
                                                .foregroundColor(model.isHighContrast ? .primary : .secondary)
                                            
                                        }
                                    })
                                    
                                    Button(action: {
                                        icon = "fossil.shell"
                                    }, label: {
                                        if icon == "fossil.shell" {
                                            
                                            Image(systemName: "fossil.shell")
                                                .fontWeight(model.fontIsBold ? .bold : .regular)
                                                .foregroundColor(Color("AccentColor"))
                                            
                                        } else {
                                            
                                            Image(systemName: "fossil.shell")
                                                .fontWeight(model.fontIsBold ? .bold : .regular)
                                                .foregroundColor(model.isHighContrast ? .primary : .secondary)
                                            
                                        }
                                    })
                                    
                                    Button(action: {
                                        icon = "laurel.leading"
                                    }, label: {
                                        if icon == "laurel.leading" {
                                            
                                            Image(systemName: "laurel.leading")
                                                .fontWeight(model.fontIsBold ? .bold : .regular)
                                                .foregroundColor(Color("AccentColor"))
                                            
                                        } else {
                                            
                                            Image(systemName: "laurel.leading")
                                                .fontWeight(model.fontIsBold ? .bold : .regular)
                                                .foregroundColor(model.isHighContrast ? .primary : .secondary)
                                            
                                        }
                                    })
                                    
                                    Button(action: {
                                        icon = "snowflake"
                                    }, label: {
                                        if icon == "snowflake" {
                                            
                                            Image(systemName: "snowflake")
                                                .fontWeight(model.fontIsBold ? .bold : .regular)
                                                .foregroundColor(Color("AccentColor"))
                                            
                                        } else {
                                            
                                            Image(systemName: "snowflake")
                                                .fontWeight(model.fontIsBold ? .bold : .regular)
                                                .foregroundColor(model.isHighContrast ? .primary : .secondary)
                                            
                                        }
                                    })
                                }
                            }
                            
                            Text("Pick an icon...")
                                .fontWeight(model.fontIsBold ? .bold : .regular)
                                .foregroundColor(model.isHighContrast ? .primary : .secondary)
                        }
                        
                        Section(header: Text("Items").fontWeight(model.fontIsBold ? .bold : .regular).foregroundColor(model.isHighContrast ? .primary : .secondary)) {
                            TextField(text: $foodName) {
                                Text("Name of your food")
                                    .foregroundColor(model.isHighContrast ? .primary : .secondary)
                            }.fontWeight(model.fontIsBold ? .bold : .regular)
                            
                            VStack {
                                if expiration == 1 {
                                    Text("The food expires in \(Int(expiration)) day")
                                        .fontWeight(model.fontIsBold ? .bold : .regular)
                                } else {
                                    Text("The food expires in \(Int(expiration)) days")
                                        .fontWeight(model.fontIsBold ? .bold : .regular)
                                }
                                
                                Slider(value: $expiration, in: 1...30)
                            }
                            
                            HStack {
                                Spacer()
                                
                                Button(action: {
                                    DataController().addFood(name: foodName, expiration: expiration, context: managedObjContext)
                                    
                                    dismiss()
                                }, label: {
                                    Text("Add item")
                                        .fontWeight(.semibold)
                                })
                                
                                Spacer()
                            }
                        }
                        
                        Section {
                            EditButton()
                                .fontWeight(model.fontIsBold ? .bold : .regular)
                                .listRowSeparator(.hidden)
                            
                            Text("Your meals will appear here...")
                                .foregroundColor(model.isHighContrast ? .primary : .secondary)
                        }
                    }
                }
            }.toolbar {
                if selection == "manually" {
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            DataController().addFood(name: foodName, expiration: expiration, context: managedObjContext)
                            
                            dismiss()
                        }, label: {
                            Text("Submit")
                                .fontWeight(.bold)
                        })
                    }
                    
                } else {
                    
                    if model.isTaken {
                        
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                model.retakePic()
                            }, label: {
                                Image(systemName: "arrow.triangle.2.circlepath.camera")
                            })
                        }
                        
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                
                            }, label: {
                                Text("Submit")
                                    .fontWeight(.bold)
                            })
                        }
                        
                    }
                    
                }
                
                ToolbarItem(placement: .principal) {
                    Text("Add a list")
                        .font(.title3.bold())
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                        
                        model.isTaken = false
                    }, label: {
                        Text("Cancel")
                            .fontWeight(model.fontIsBold ? .bold : .regular)
                    })
                }
                
                ToolbarItem(placement: .bottomBar) {
                    Picker("", selection: $selection) {
                        Text("Create manually")
                            .tag("manually")
                        
                        Text("Use a camera")
                            .tag("camera")
                    }.pickerStyle(.segmented)
                }
            }
        }.preferredColorScheme(model.isDarkMode ? .dark : .light)
    }
}

struct CameraPreview: UIViewRepresentable {
    
    @EnvironmentObject var model: ContentModel
    
    func makeUIView(context: Context) -> UIView {
        
        let view = UIView(frame: UIScreen.main.bounds)
        
        DispatchQueue.main.async {
            model.preview = AVCaptureVideoPreviewLayer(session: model.session)
            model.preview.frame = view.frame
            model.preview.videoGravity = .resizeAspectFill
            view.layer.addSublayer(model.preview)
        }
            
        DispatchQueue.global(qos: .background).async {
            model.session.startRunning()
        }
        
        return view
        
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
    
}

struct AddListView_Previews: PreviewProvider {
    static var previews: some View {
        AddListView()
            .environmentObject(ContentModel())
    }
}
