//
//  fantasyView.swift
//  fantasyRole
//
//  Created by monscerrat gutierrez on 16/05/24.
//



import SwiftUI
import Kingfisher


struct GnomoListView: View {
    @StateObject private var viewModel = fantasyViewModel()
    @State private var selectedGnomo: Brastlewark?
    
    var body: some View {
        NavigationView {
            VStack {
                if !viewModel.imageUrls.isEmpty {
                    ScrollView {
                        LazyVStack{
                            ForEach(viewModel.imageUrls, id: \.self) { imageUrl in
                                
                                
                                KFImage(URL(string: imageUrl))
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 200, height: 200)
                                    .cornerRadius(50)
                                    .shadow(color: Color.blue.opacity(0.8), radius: 20, x: 0, y: 6)
                                    .padding()
                                    .onTapGesture {
                                        if let gnomo = viewModel.getGenomo(for: imageUrl) {
                                            selectedGnomo = gnomo
                                        }
                                    }
                                
                                
                                Spacer().frame(height: 30)
                            }
                        }
                    }
                    
                } else if let error = viewModel.error {
                    Text("Failed to load data: \(error.localizedDescription)")
                } else {
                    Text("Loading...")
                }
            }
            .navigationBarTitle("GNOMITOS")
            .fontWidth(.standard)
            .padding(.bottom, 4)
            .sheet(item: $selectedGnomo) { gnomo in
                if let imageUrl = viewModel.imageUrls.first(where: { $0 == gnomo.thumbnail }) {
                    GnomoDetailView(gnomo: gnomo, imageUrl: imageUrl)
            }
        }
    
                    .onAppear {
                        viewModel.getContent()
                        
                    }
                    .foregroundColor(.white)
            }
        }
        
        struct GnomoDetailView: View {
            let gnomo: Brastlewark
            let imageUrl: String
            
            var body: some View {
                VStack {
                    
                    KFImage(URL(string: imageUrl))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .cornerRadius(50)
                        .shadow(color: Color.blue.opacity(0.8), radius: 20, x: 0, y: 6)
                        .padding()
                    
                    Spacer().frame(height: 35)
                    Text("Name: ").italic()
                        .foregroundColor(.gray) +
                    Text("\(gnomo.name)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Spacer().frame(height: 30)
                    Text("Age: ").italic()
                        .foregroundColor(.gray) +
                    Text("\(gnomo.age)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Spacer().frame(height: 30)
                    Text("Hair Color: ").italic()
                        .foregroundColor(.gray) +
                    Text("\(gnomo.hairColor.rawValue)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Spacer().frame(height: 30)
                    Text("Professions: ").italic()
                        .foregroundColor(.gray) +
                    Text(gnomo.professions.map { $0.rawValue }.joined(separator: ", "))
                        .font(.subheadline)
                        .foregroundColor(.blue)
                    Spacer()
                    
                }
            }
        }
    }
    
    struct GnomoListView_Previews: PreviewProvider {
        static var previews: some View {
            GnomoListView()
        }
    }
    extension Brastlewark: Identifiable {}
    
    
    

