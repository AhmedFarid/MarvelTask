//
//  DetailsViewModel.swift
//  MarvelTask
//
//  Created by Systems on 27/02/2024.
//

import Foundation
import RxSwift
import RxCocoa

protocol DetailsViewModelProtocol: AnyObject {
    var input: DetailsViewModel.Input { get }
    var output: DetailsViewModel.Output { get }
    func viewDidLoad()
}

enum DetailsBinding {
    case showHud
    case dismissHud

    case succeedMessage(String)
    case failMessage(String)
}

class DetailsViewModel: DetailsViewModelProtocol, ViewModel {
    class Input {

    }

    class Output {
        var homeData: HomeModel?
    }

    var input: Input = .init()
    var output: Output = .init()
    private var homeData: HomeModel?

    init(homeData: HomeModel? = nil) {
        self.homeData = homeData
    }

    private let bag = DisposeBag()

    func viewDidLoad() {
        output.homeData = homeData
    }
}
