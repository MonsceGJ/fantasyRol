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
            ZStack {
                Color(red: 19/255, green: 30/255, blue: 53/255, opacity: 1.0)
                    .ignoresSafeArea()
                VStack {
                    searchBar(text: $viewModel.searchText)
                        .padding(.horizontal)
                    if !viewModel.filtros.isEmpty {
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
                .font(.system(size: 25))
                .foregroundColor(.white)
                .padding(.bottom, 4)
                .sheet(item: $selectedGnomo) { gnomo in
                    if let imageUrl = viewModel.imageUrls.first(where: { $0 == gnomo.thumbnail }) {
                        GnomoDetailView(gnomo: gnomo, imageUrl: imageUrl)
                    }
                }
                
                .onAppear {
                    viewModel.getContent()
                    
                }
                .onChange(of: viewModel.searchText) { _ in
                    viewModel.filtros
                    
                }
//                .foregroundColor(.white)
            }
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
extension Brastlewark: Identifiable {
    
}

struct searchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField("BUSCAR GNOAMIGOS", text: $text)
                .padding(8)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Spacer()
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .padding(.trailing)
                        
                    })
            
        }
        .padding(.horizontal)
        
    }
    
}




