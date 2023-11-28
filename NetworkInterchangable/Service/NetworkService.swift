//
//  NetworkService.swift
//  NetworkInterchangable
//
//  Created by Berkcan Gürsoy on 25.11.2023.
//

import Foundation


protocol NetworkService {
    func download(_ resource: String) async throws -> [User]
    var type : String { get }
}
