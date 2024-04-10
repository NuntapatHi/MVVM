//
//  Request.swift
//  MVVM
//
//  Created by Nuntapat Hirunnattee on 10/4/2567 BE.
//

import Foundation

protocol EndpointComponents {
    // Required
    var baseURL: String { get }
    var path: String { get }
}

// Main
enum Endpoint {
    case users
}

extension Endpoint: EndpointComponents {
    // Required
    var baseURL: String {
        return "https://jsonplaceholder.typicode.com/"
    }

    var path: String {
        switch self {
        case .users:
            return "users"
        }
    }
    
}
