//
//  ContentView.swift
//  fantasyRole
//
//  Created by monscerrat gutierrez on 16/05/24.
//

import SwiftUI

struct ContentView: View {
    @State private var secondScreen = false
    @State private var searchText = ""
    @State private var searchResults: [Brastlewark] = []
    @State private var selectedGnomo: Brastlewark?
    var body: some View {
        
        NavigationView {
            ZStack {
              
                Color(red: 19/255, green: 30/255, blue: 53/255, opacity: 1.0)
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    
                    Image("gnomo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding( .bottom , 42)
                        .shadow(color: Color.blue.opacity(0.8), radius: 20, x: 0, y: 6)
                    
                    Button(action: searchFrieds) {
                        Text("ENCONTRAR GNOAMIGOS")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                            .overlay(RoundedRectangle(cornerRadius: 6.0)
                                .stroke(Color("Dark-Cian"), lineWidth: 1.0)
                                .shadow(color:.white, radius: 6))
                        
                    }
                   
                    
                    NavigationLink(
                        
                        destination: GnomoListView(),
                        isActive: $secondScreen,
                        label: {
                            EmptyView()
                        })
                    
                }
                
                
            }
            
            
            
            .padding()
        }
    }
        
        func searchFrieds() {
            print("Estoy buscando amigos")
            secondScreen = true
        }
    }
    

