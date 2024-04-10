//
//  NetworkLayer.swift
//  MVVM
//
//  Created by Nuntapat Hirunnattee on 10/4/2567 BE.
//

import Foundation

protocol NetworkServiceType {
    func request<T: Decodable>(endpoint: Endpoint, response: T.Type) async throws -> T
}

final class NetworkService: NetworkServiceType {
    
    // Singleton
    static let shared = NetworkService()
    
    // privates
    private let session = URLSession.shared
    private init() { }
    
    func request<T>(endpoint: Endpoint, response: T.Type) async throws -> T where T : Decodable {
        guard let url = URL(string: "\(endpoint.baseURL)\(endpoint.path)") else { throw NetworkError.invalidURL }
        let (data, response) = try await session.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse else { throw NetworkError.invalidResponse }
        
        switch httpResponse.statusCode {
        case 200...299:
            do {
                return try JSONDecoder().decode(T.self, from: data)
            } catch {
                throw NetworkError.decodingFailed
            }
        case 400...499:
            throw NetworkError.clientResponseError
        case 500...599:
            throw NetworkError.serverResponseError
        default:
            throw NetworkError.unknowResponseError
        }
    }
    
}
