//
//  fantasyViewModel.swift
//  fantasyRole
//
//  Created by monscerrat gutierrez on 16/05/24.
//

import Foundation

class fantasyViewModel: ObservableObject {
    
    @Published var contenViewModel: [Brastlewark]?
    @Published var error: Error?
    
    let apliClientModel = ApiClient()
    
    
    func getContent(Query: String) {
        apliClientModel.searchinhabitant(query: Query) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let habitans):
                    self.contenViewModel = habitans
                    print("Result \(habitans)")
                case.failure(let error):
                    print("error fetching habitants \(error)")
                    
                    
                    
                }
            }
        }
        
        
    }
}
