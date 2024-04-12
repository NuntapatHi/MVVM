//
//  BaseViewController.swift
//  MVVM
//
//  Created by Nuntapat Hirunnattee on 10/4/2567 BE.
//

import Foundation
import UIKit

class BaseViewController<T: BaseViewModelType>: UIViewController {
    
    var viewModel: T?
    
    // MARK: - Initializer
    convenience init(viewModel: T? = nil, modalPresentationStyle: UIModalPresentationStyle = .fullScreen) {
        self.init(nibName: Self.viewControllerName, bundle: nil)
        self.modalPresentationStyle = modalPresentationStyle
        self.viewModel = viewModel
    }
    
    deinit {
        print("♺ \(Self.viewControllerName) Deinited")
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        if let viewModel = viewModel {
            bindOutput(viewModel: viewModel)
            bindInput(viewModel: viewModel)
        }
        
    }
    
    func setup() { }
    
    func bindInput(viewModel: T) { }
    
    func bindOutput(viewModel: T) { }
    
    private class var viewControllerName: String {
        return String(describing: self)
    }
    
}
