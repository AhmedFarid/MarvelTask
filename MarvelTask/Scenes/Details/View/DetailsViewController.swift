//
//  DetailsViewController.swift
//  MarvelTask
//
//  Created by Systems on 27/02/2024.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var detailsImage: UIImageView!
    @IBOutlet weak var detailsDescription: UITextView!

    private let viewModel: DetailsViewModelProtocol
    weak var coordinator: DetailsTransitionDelegate?

    init(viewModel: DetailsViewModelProtocol = DetailsViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: "DetailsViewController", bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }

    override func viewWillDisappear(_ animated: Bool) {
        coordinator?.backHome()
    }

    func setupUI() {
        detailsDescription.text = viewModel.output.homeData?.title
        ImageLoaderHelper.loadImage(imageUrl: viewModel.output.homeData?.url ?? "", imageView: detailsImage)
    }
}
