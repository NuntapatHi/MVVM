//
//  NetworkError.swift
//  MVVM
//
//  Created by Nuntapat Hirunnattee on 10/4/2567 BE.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case decodingFailed
    case clientResponseError
    case serverResponseError
    case unknowResponseError
}
