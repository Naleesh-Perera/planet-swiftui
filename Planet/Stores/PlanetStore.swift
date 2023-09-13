//  PlanetStore.swift
//  Planet
//  Created by Naleesh Jeffrey on 2023-09-13.

import Foundation
import Combine

class PlanetStore: ObservableObject {
    
    @Published var planetData: PlanetData?
    @Published var fetchingData = true
    
    private var cancellables: Set<AnyCancellable> = []
    
    init(){
        fetchPlanetData()
    }
    
    
    private func fetchPlanetData(){
        Task(priority:.high){
            await NetManager.shared.fetchData(from: .planetLoad, responseType: PlanetData.self)
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { _ in }) {
                    self.planetData = $0
                }
                .store(in: &cancellables)
            fetchingData.toggle()
        }
    }
    
    func removePlanet(){
        
    }
    
    func addPlanet(){
        
    }
    
    
    
    // deInit
    deinit{
        cancellables.removeAll()
    }
}
