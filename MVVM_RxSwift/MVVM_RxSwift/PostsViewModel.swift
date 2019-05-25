//
//  ViewModel.swift
//  MVVM_RxSwift
//
//  Created by Kishore Kumar Elanchezhiyan on 26/05/19.
//  Copyright © 2019 KiSh. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class PostsViewModel: ViewModelType {
    struct Input {
        let trigger: Driver<Void>
    }
    
    struct Output {
        let posts: Driver<[Post]>
    }
    
    func transform(input: Input) -> Output {
        let post = PostsDataManager.shared.getPosts()
        let postDriver = input.trigger.flatMapLatest{ _ in
            return post.asDriver(onErrorJustReturn: [])
        }
        return Output(posts: postDriver)
    }
    
}
