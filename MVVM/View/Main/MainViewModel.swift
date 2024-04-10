//
//  MainViewModel.swift
//  MVVM
//
//  Created by Nuntapat Hirunnattee on 10/4/2567 BE.
//

import Foundation

protocol MainViewModelInput {
    var users: [UserEntity]? { get }
}

protocol MainViewModelOutput {
    var updateUsers: (([UserEntity]) -> Void)? { get }
}

class MainViewModel: BaseViewModelType, MainViewModelInput, MainViewModelOutput {
    // inputs
    var users: [UserEntity]? {
        didSet {
            guard let updateUsers, let users = users else { return }
            updateUsers(users)
        }
    }
    
    // outputs
    var updateUsers: (([UserEntity]) -> Void)?
    
    // privates
    private let networkService: NetworkService
    
    init(networkService: NetworkService = .shared) {
        self.networkService = networkService
    }
    
    func requestUsers() async {
        do {
            users = try await networkService.request(endpoint: .users, response: [UserEntity].self)
        } catch {
            print("Request Users Error : \(error) -> \(error.localizedDescription)")
        }
    }
}
