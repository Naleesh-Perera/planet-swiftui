//  NetManger.swift
//  Planet
//  Created by Naleesh Jeffrey on 2023-09-13.

import Foundation
import Combine

actor NetManager {
    
    static let shared = NetManager()
    private init() {}
    
    func fetchData<T: Decodable>(from endpoint: EndPoint, responseType: T.Type) -> AnyPublisher<T, Error> {
        
        guard let url = URL(string: endpoint.rawValue) else {
            return Fail(error: NSError(domain: "Invalid URL", code: 0, userInfo: nil)).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func uploadData(){
        
    }
    
    func downloadData() -> Data{
        Data()
    }
    
}
