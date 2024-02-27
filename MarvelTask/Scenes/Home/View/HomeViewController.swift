//
//  HomeViewController.swift
//  MarvelTask
//
//  Created by Systems on 27/02/2024.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTF: UITextField!

    // MARK: - Variables
    private let viewModel: HomeViewModelProtocol
    weak var coordinator: HomeTransitionDelegate?
    let bag = DisposeBag()

    // MARK: - Init
    init(viewModel: HomeViewModelProtocol = HomeViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: "HomeViewController", bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindingFromViewModelWithStates()
        setupRegisterTableView()
        subscribeWithTableView()
        bindToViewModel()
        viewModel.viewDidLoad()
        didSelectTableView()
    }

    // MARK: - Main Function
    func setupUI() {
        title = "Home"
    }

    func setupRegisterTableView() {
        tableView.register(UINib(nibName: String(describing: HomeTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: HomeTableViewCell.self))
    }

    func bindToViewModel() {
        searchTF.rx.text.orEmpty.bind(to: viewModel.input.searchTextBehavior).disposed(by: bag)
    }

    func subscribeWithTableView() {
        viewModel.output.homeDataPublish.bind(to: tableView.rx.items(cellIdentifier: String(describing: HomeTableViewCell.self), cellType: HomeTableViewCell.self)) { index, homeData, cell in
            cell.configCell(data: homeData)
        }.disposed(by: bag)
    }

    func didSelectTableView() {
            tableView.rx.modelSelected(HomeModel.self).subscribe(onNext: { [weak self] homeData in
                guard let self = self else {return}
                coordinator?.goDetails(homeData: homeData)
            }).disposed(by: bag)
        }
}

extension HomeViewController {
    func bindingFromViewModelWithStates() {
        viewModel.input.bindingState.subscribe(onNext: { [weak self] bindingStates in
            guard let self = self else {return}
            switch bindingStates {
            case .showHud:
                print("showHud")
            case .dismissHud:
                print("dismissHud")
            case .succeedMessage(let message):
                print(message)
            case .failMessage(let error):
                print(error)
            }
        }).disposed(by: bag)
    }
}
