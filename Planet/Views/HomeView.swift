//  ContentView.swift
//  Planet
//  Created by Naleesh Jeffrey on 2023-09-13.

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var planetStore: PlanetStore
    @StateObject private var vm = HomeVm()
    
    var body: some View {
        if let planets = planetStore.planetData{
            List(planets.results) {
                getPlanetCell($0)
            }
            .navigationBarTitle("Planets")
        }else{
            LoadingListView(title: "Planets")
        }
    }
}

extension HomeView{
    func getPlanetCell(_ planet: Planet) -> some View {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
