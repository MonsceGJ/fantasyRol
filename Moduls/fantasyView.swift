//
//  fantasyView.swift
//  fantasyRole
//
//  Created by monscerrat gutierrez on 16/05/24.
//

import SwiftUI

struct fantasyView: View {
    
    let gnome: Brastlewark
    var body: some View {
        VStack(alignment: .leading) {
            Text("Nombre: \(gnome.name)")
            Text("Edad: \(gnome.age)")
            Text("Peso: \(gnome.weight)")
            Text("Altra: \(gnome.height)")
            Text("Color de pelo: \(gnome.hairColor)")
            Text("")
        }
    }
}

#Preview {
    fantasyView()
}
