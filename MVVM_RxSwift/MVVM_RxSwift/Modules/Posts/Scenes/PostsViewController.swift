//
//  ViewController.swift
//  MVVM_RxSwift
//
//  Created by Kishore Kumar Elanchezhiyan on 25/05/19.
//  Copyright © 2019 KiSh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ViewControllerType {
    
    
    typealias ViewModel = PostsViewModel
    var viewModel: PostsViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func bindViewModel() {
        
    }

}

