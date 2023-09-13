//  PlanetStore.swift
//  Planet
//  Created by Naleesh Jeffrey on 2023-09-13.

import Foundation
import Combine

class PlanetStore: ObservableObject {
    
    @Published var planetData: PlanetData?
    
    private var cancellables: Set<AnyCancellable> = []
    
    init(){
        Task(priority:.high){
            await fetchPlanetData()
        }
    }
    
    
    private func fetchPlanetData()async{
        await NetManager.shared.fetchData(from: .planetLoad, responseType: PlanetData.self)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }) { [weak self] pData in
                self?.planetData = pData
            }
            .store(in: &cancellables)
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
