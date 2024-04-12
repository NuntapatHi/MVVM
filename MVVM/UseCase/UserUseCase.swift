//
//  UserUseCase.swift
//  MVVM
//
//  Created by Nuntapat Hirunnattee on 10/4/2567 BE.
//

import Foundation

class UserUseCase {
    
    private let networkService: NetworkService
    private let userDefault: UserDefault
    
    init(networkService: NetworkService, userDefault: UserDefault) {
        self.networkService = networkService
        self.userDefault = userDefault
        
    }
    
    func fetchUsers() async -> Result<[UserEntity], Error> {
        return await Task { try await networkService.request(endpoint: .users, response: [UserEntity].self) }.result
    }
}
