//  PlanetData.swift
//  Planet
//  Created by Naleesh Jeffrey on 2023-09-13.

import Foundation

class PlanetData: Decodable,Encodable{
    
    let count: Int?
    let next: String
    let previous: String?
    let results: [Planet]
    
}
