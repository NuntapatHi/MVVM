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
    
    convenience init(viewModel: T? = nil, modalPresentationStyle: UIModalPresentationStyle = .fullScreen) {
        self.init(nibName: Self.viewControllerName, bundle: nil)
        self.modalPresentationStyle = modalPresentationStyle
        self.viewModel = viewModel
    }
    
    deinit {
        print("Deinit \(Self.viewControllerName)")
    }
    
    private class var viewControllerName: String {
        return String(describing: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let viewModel = viewModel {
            bindOutput(viewModel: viewModel)
            bindInput(viewModel: viewModel)
        }
        
    }
    
    func bindInput(viewModel: T) { }
    
    func bindOutput(viewModel: T) { }
    
}
