//
//  HomeViewModel.swift
//  MarvelTask
//
//  Created by Systems on 27/02/2024.
//

import Foundation
import RxSwift
import RxCocoa

protocol HomeViewModelProtocol: AnyObject {
    var input: HomeViewModel.Input { get }
    var output: HomeViewModel.Output { get }
    func viewDidLoad()
}

enum HomeBinding {
    case showHud
    case dismissHud

    case succeedMessage(String)
    case failMessage(String)
}

class HomeViewModel: HomeViewModelProtocol, ViewModel {
    class Input {
        var searchTextBehavior: BehaviorRelay<String> = .init(value: "")
        var bindingState: PublishSubject<HomeBinding> = .init()
    }

    class Output {
        var homeDataPublish: PublishSubject<[HomeModel]> = .init()
    }

    var input: Input = .init()
    var output: Output = .init()

    private let bag = DisposeBag()
    private let homeAPI = HomeAPI()
    private var collectedAllHomePublish = PublishSubject<[HomeModel]>()

    func viewDidLoad() {
        handleSearchWithPostsOutput()
        callPostFromApi()
    }

    private func callPostFromApi() {
        input.bindingState.onNext(.showHud)
        homeAPI.getHomeData { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.collectedAllHomePublish.onNext(response ?? [])
                self.input.bindingState.onNext(.succeedMessage("Succeed Data from api"))
                self.input.bindingState.onNext(.dismissHud)
            case .failure(let error):
                self.input.bindingState.onNext(.failMessage (error.localizedDescription))
            }
        }
    }

    private func handleSearchWithPostsOutput() {
        Observable.combineLatest(collectedAllHomePublish, input.searchTextBehavior)
            .map { [weak self] (posts, search) in
                //guard let self = self else { return }
                if search.isEmpty { return posts }
                return posts.filter {$0.title.lowercased().contains(search.lowercased())}
            }.bind(to: output.homeDataPublish).disposed(by: bag)
    }
}
