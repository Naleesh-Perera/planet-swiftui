//  PlanetView.swift
//  Planet
//  Created by Naleesh Jeffrey on 2023-09-13.

import SwiftUI

struct PlanetView: View {
    
    let planet: Planet
    
    var body: some View {
        VStack(alignment: .leading,spacing: 20){
            AsyncImage(url: URL(string: "https://picsum.photos/200")) {
                $0
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(15)
            } placeholder: {
                ProgressView()
                    .padding()
                    .alignCenter(.vertical)
                    .frame(width: 200,height: 200)
            }
            Text("Planet Name: \(planet.name)")
                .font(.title)
            Text("Orbital Period: \(planet.orbitalPeriod)")
                .font(.title3)
            Text("Gravity: \(planet.gravity)")
                .font(.headline)
            Spacer()
        }
        .padding()
    }
}
