//
//  DetailsViewController.swift
//  ProjBornlogic
//
//  Created by Jonathan Alajoan Nascimento Rocha on 15/08/22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    private lazy var mainView: DetailsMainView = {
        let view = DetailsMainView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var presenter: DetailsPresenter = {
        let presenter = DetailsPresenter()
        return presenter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.mainView.setupViewData(
            title: presenter.getDetailTitle(),
            content: presenter.getDetailContent(),
            image: presenter.getDetailImage(),
            publishedAt: presenter.getDetailPublishedAt()
        )
        layoutViews()
        presenter.getHTML()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    convenience init(data: Details) {
        self.init(nibName: nil, bundle: nil)
        self.presenter.data = data
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

//MARK: - Layout
extension DetailsViewController {
    private func layoutViews() {
        view.addSubview(mainView)
        NSLayoutConstraint.activate([
            // MARK: - mainViewConstraints
            mainView.topAnchor.constraint(
                equalTo: view.layoutMarginsGuide.topAnchor
            ),
            mainView.leadingAnchor.constraint(
                equalTo: view.layoutMarginsGuide.leadingAnchor
            ),
            mainView.trailingAnchor.constraint(
                equalTo: view.layoutMarginsGuide.trailingAnchor
            ),
            mainView.bottomAnchor.constraint(
                equalTo: view.layoutMarginsGuide.bottomAnchor
            )
        ])
    }
}
