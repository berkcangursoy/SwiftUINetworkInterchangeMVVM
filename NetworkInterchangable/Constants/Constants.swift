//
//  Constants.swift
//  NetworkInterchangable
//
//  Created by Berkcan Gürsoy on 25.11.2023.
//

import Foundation


struct Constants {
    
    struct Paths { // localservice
        static let baseUrl = "users"
    }
    
    struct Urls { // webservice
        static let baseUrl = "https://jsonplaceholder.typicode.com"
        static let userExtension = "\(baseUrl)/users"
    }
}
