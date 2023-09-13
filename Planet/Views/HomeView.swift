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
                HomePlanetCell(planet: $0)
            }
            .navigationBarTitle("Planets")
        }else{
            LoadingListView(title: "Planets")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
