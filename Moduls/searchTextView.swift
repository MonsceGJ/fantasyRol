//
//  searchTextView.swift
//  fantasyRole
//
//  Created by monscerrat gutierrez on 20/05/24.
//

import SwiftUI
import Kingfisher

struct searchTextView: View {
    
    let searchGnomo: Brastlewark
    
    var body: some View {
      
            VStack {
                KFImage(URL(string: searchGnomo.thumbnail))
                    .resizable()
                                   .aspectRatio(contentMode: .fit)
                                   .frame(width: 200, height: 200)
                                   .cornerRadius(50)
                                   .shadow(color: Color.blue.opacity(0.8), radius: 20, x: 0, y: 6)
                                   .padding()
                Spacer().frame(height: 35)
                
                        Text("Name: \(searchGnomo.name)")
                            .font(.title)
                            .foregroundColor(.white)
                        
                        Text("Age: \(searchGnomo.age)")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Text("Hair Color: \(searchGnomo.hairColor.rawValue)")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Text("Professions: \(searchGnomo.professions.map { $0.rawValue }.joined(separator: ", "))")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Spacer()
                
            }
            .navigationTitle(searchGnomo.name)
        
    }
}

//#Preview {
//    searchTextView(searchGnomo: <#Brastlewark#>)
//}
