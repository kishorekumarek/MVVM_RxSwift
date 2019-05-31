# MVVM_RxSwift
MVVM Architecture pattern with RxSwift is fun when we fully utilize the power of RX

# ViewControllerType
ViewControllerType, if we think about it we would want two mandatory functions, One is viewmodel variable and other is a func for binding the viewmodel
```
protocol ViewControllerType {
    associatedtype ViewModel: ViewModelType
    var viewModel: ViewModel! { get set}
    func bindViewModel()
}
```

#  ViewModelType
Basically, ViewModel's function is to receive input from Viewcontroller process the input and convert it into Output. We have taken fetching posts from network as an example

```
protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    func transform(input: Input) -> Output
}
```

## Segregating the problem
Now lets say we have a array of posts object to fetch from network or DB in future(We will implement Repository layer in Same Repo later). So There is a VC with a tableview that displays a list of posts that is fetched from network(for now).

### Input and Output
Input and Output can be struct that contains Driver(Rx).

```
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
```

Feel free to dive into this simple code structure to understand the Usage

