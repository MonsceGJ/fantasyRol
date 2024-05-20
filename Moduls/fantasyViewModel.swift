//
//  fantasyViewModel.swift
//  fantasyRole
//
//  Created by monscerrat gutierrez on 16/05/24.
//

import Foundation

class fantasyViewModel: ObservableObject {
    
    @Published var contenViewModel: FantasyRole?
    @Published var error: Error?
    @Published var imageUrls: [String] = []
    
    let apliClientModel = ApiClient()
    
    func getContent() {
        apliClientModel.searchinhabitant { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let inhabitans):
                    self.contenViewModel = inhabitans
                    self.error = nil
                    self.imageUrls = inhabitans.brastlewark.map { $0.thumbnail}
                    print("Habitantes obtenidos \(inhabitans)")
                case .failure(let error):
                    self.error = error
                    print("error fetching habitants \(error)")
                }
            }
        }
    }
    
    func getGenomo(for imageUrl: String) -> Brastlewark? {
        guard let inhabitants = contenViewModel else { return nil}
        return inhabitants.brastlewark.first(where: { $0.thumbnail == imageUrl })
    }
    
    func refreshData () {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.getContent()
        }
    }
}
