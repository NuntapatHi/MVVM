//
//  UseCaseProvider.swift
//  MVVM
//
//  Created by Nuntapat Hirunnattee on 10/4/2567 BE.
//

protocol UseCaseServiceProtocol {
    var userDefault: UserDefault { get }
    var networkService: NetworkService { get }
    var bundle: Bundle { get }
}

protocol UseCaseServiceServices {
    func provideUserUseCase() -> UserUseCase
}

import Foundation

class UseCaseProvider: UseCaseServiceProtocol {
    static let shared  = UseCaseProvider
    let userDefault: UserDefault
    let networkService: NetworkService
    let bundle: Bundle
    
    
    init(userDefault: UserDefault = UserDefault.shared,
         networkService: NetworkService = NetworkService.shared,
         bundle: Bundle = Bundle.main
    ) {
        self.userDefault = userDefault
        self.networkService = networkService
        self.bundle = bundle
    }
    
    func provideUserUseCase() async -> UserUseCase {
        return await UserUseCase(networkService: networkService, userDefault: userDefault)
    }
}
