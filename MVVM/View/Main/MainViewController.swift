//
//  MainViewController.swift
//  MVVM
//
//  Created by Nuntapat Hirunnattee on 10/4/2567 BE.
//

import UIKit

class MainViewController: BaseViewController<MainViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
    }
    
    override func bindInput(viewModel: MainViewModel) {
        super.bindInput(viewModel: viewModel)
        Task {
            await viewModel.requestUsers()
        }
    }
    
    override func bindOutput(viewModel: MainViewModel) {
        super.bindOutput(viewModel: viewModel)
        
        viewModel.updateUsers = { [weak self] users in
            guard let self = self else { return }
            self.updateUser(users: users)
        }
    }
    
    func updateUser(users: [UserEntity]) {
        users.forEach({ print($0.name) })
    }
    
}
