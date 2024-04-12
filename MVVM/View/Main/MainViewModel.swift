//
//  MainViewModel.swift
//  MVVM
//
//  Created by Nuntapat Hirunnattee on 10/4/2567 BE.
//

import Foundation

protocol MainViewModelInput {
    var users: [UserEntity] { get }
    var onError: Error? { get }
    func fetchUser() async
}

protocol MainViewModelOutput {
    var updateUsers: (([UserEntity]) -> Void)? { get }
    var alertError: ((Error) -> Void)? { get }
}

class MainViewModel: BaseViewModelType, MainViewModelInput, MainViewModelOutput {
    
    // Privates
    private let userUseCase: UserUseCase
    
    // MARK: - Initializer
    init(useCaseProvider: UseCaseProvider) {
        self.userUseCase = useCaseProvider.provideUserUseCase()
        
    }
    
    // MARK: - Inputs
    var users: [UserEntity] = [] {
        didSet {
            guard let updateUsers = updateUsers else { return }
            print("update users")
            updateUsers(users)
        }
    }
    
    var onError: Error? {
        didSet {
            guard let alertError, let error = onError else { return }
            alertError(error)
            
        }
    }
    
    func fetchUser() async {
        let result: Result<[UserEntity], Error> = await userUseCase.fetchUsers()
        switch result {
        case .success(let data):
            users = data
        case .failure(let error):
            onError = error
        }
        
    }
    
    // MARK: - Outputs
    var updateUsers: (([UserEntity]) -> Void)?
    var alertError: ((Error) -> Void)?
    
}
