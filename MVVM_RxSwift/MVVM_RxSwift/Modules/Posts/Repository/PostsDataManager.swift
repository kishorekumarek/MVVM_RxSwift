//
//  DataManager.swift
//  MVVM_RxSwift
//
//  Created by Kishore Kumar Elanchezhiyan on 26/05/19.
//  Copyright © 2019 KiSh. All rights reserved.
//

import Foundation
import RxSwift

private let urlString = "https://jsonplaceholder.typicode.com/posts"

protocol PostsUseCase {
    func getPosts() -> Single<[Post]>
}

class PostsDataManager: PostsUseCase {
    
    static let shared = PostsDataManager()
    
    func getPosts() -> Single<[Post]> {
        return Single<[Post]>.create(subscribe: { (observer) -> Disposable in
            observer(.success([]))
            return Disposables.create {
                
            }
        })
    }
}
