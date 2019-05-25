//
//  Protocols.swift
//  MVVM_RxSwift
//
//  Created by Kishore Kumar Elanchezhiyan on 26/05/19.
//  Copyright © 2019 KiSh. All rights reserved.
//

import Foundation
import UIKit

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    func transform(input: Input) -> Output
}

protocol ViewControllerType {
    associatedtype ViewModel: ViewModelType
    var viewModel: ViewModel! { get set}
    func bindViewModel()
}
