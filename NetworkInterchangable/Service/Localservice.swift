//
//  Localservice.swift
//  NetworkInterchangable
//
//  Created by Berkcan Gürsoy on 25.11.2023.
//

import Foundation


class Localservice :NetworkService {
    var type: String = "Localservice"
    
    func download(_ resource: String) async throws -> [User] {
        
        guard let path = Bundle.main.path(forResource: resource, ofType: "json") else {
            fatalError("Resource Not Found")
        }
        
        let data = try Data(contentsOf: URL(filePath: path))
        
        return try JSONDecoder().decode([User].self, from: data)
    }
}
