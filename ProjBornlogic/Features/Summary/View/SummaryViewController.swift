//
//  SummaryViewController.swift
//  ProjBornlogic
//
//  Created by Jonathan Alajoan Nascimento Rocha on 11/08/22.
//

import UIKit

final class SummaryViewController: UIViewController {
    
    private lazy var mainView: SummaryMainView = {
        var mainView = SummaryMainView(delegate: self)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        return mainView
    }()
    
    private lazy var presenter: SummaryPresenter = {
        var presenter = SummaryPresenter()
        return presenter
    }()
    
    var images: [UIImage] = []
    var titles: [String] = []
    var descriptions: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutViews()
        images = presenter.setImages()
        titles = presenter.setTexts()
        descriptions = presenter.setDescriptions()
        view.backgroundColor = .cyan
        presenter.getArticles(with: "Android")
    }
}

//MARK: - Layout
extension SummaryViewController {
    private func layoutViews() {
        view.addSubview(mainView)
        NSLayoutConstraint.activate([
            // MARK: - mainViewConstraints
            mainView.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: 0
            ),
            mainView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 0
            ),
            mainView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: 0
            ),
            mainView.bottomAnchor.constraint(
                equalTo: view.bottomAnchor,
                constant: 0
            )
        ])
    }
}

extension SummaryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SummaryTableViewCell.identifier, for: indexPath) as! SummaryTableViewCell
        
        cell.setData(
            title: titles[indexPath.row],
            image: images[indexPath.row],
            description: descriptions[indexPath.row]
        )
        
        return cell
    }
}

extension SummaryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
}
