//
//  MainViewController.swift
//  MVVM
//
//  Created by Nuntapat Hirunnattee on 10/4/2567 BE.
//

import UIKit

class MainViewController: BaseViewController<MainViewModel> {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var refreshBarButtonItem: UIBarButtonItem {
        let buttonImage: UIImage? = UIImage(systemName: "arrow.2.squarepath")
        let backButton: UIBarButtonItem = .init(image: buttonImage, style: .plain, target: self, action: #selector(refreshTap))
        backButton.tintColor = UIColor.white
        return backButton
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        Task {
            await viewModel?.fetchUser()
        }
        
    }
    
    override func setup() {
        super.setup()
        title = "Users"
        tableView.registerWithXib(UserCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        navigationItem.rightBarButtonItem = refreshBarButtonItem
        
    }
    
    override func bindInput(viewModel: MainViewModel) {
        super.bindInput(viewModel: viewModel)
        
    }
    
    override func bindOutput(viewModel: MainViewModel) {
        super.bindOutput(viewModel: viewModel)
        
        viewModel.updateUsers = { [weak self] users in
            guard let self = self else { return }
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                for (index, user) in users.enumerated() {
                    print("\(index). \(user.name)")
                }
                tableView.reloadData()
                print("Reload Table View!")
            }
        }
        
        viewModel.alertError = { error in
            print("💔\(error) : \(error.localizedDescription)")
        }
        
    }
    
    @objc func refreshTap() {
        guard let viewModel = viewModel else { return }
        Task {
            await viewModel.fetchUser()
        }
    }
    
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.users.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let users = viewModel?.users else { return UITableViewCell() }
        let cell: UserCell = tableView.dequeueReusableCell(for: indexPath)
        cell.config(users[indexPath.row])
        return cell
    }
    
}
