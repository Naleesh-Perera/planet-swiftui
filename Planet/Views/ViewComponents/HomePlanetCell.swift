//  HomePlanetCell.swift
//  Planet
//  Created by Naleesh Jeffrey on 2023-09-13.

import SwiftUI

struct HomePlanetCell: View {
    
    let planet: Planet
    
    var body: some View {
        NavigationLink(destination: PlanetView(planet: planet)){
            HStack {
                AsyncImage(url: URL(string: "https://picsum.photos/200")) {
                    $0
                        .resizable()
                        .scaledToFit()
                        .frame(width:50)
                        .clipShape(Circle())
                } placeholder: {
                    ProgressView()
                        .padding()
                }
                VStack(alignment: .leading) {
                    Text(planet.name)
                        .font(.title3)
                        .fontWeight(.semibold)
                    Text("Climate: \(planet.climate)")
                        .font(.subheadline)
                }
            }
        }
    }
}
