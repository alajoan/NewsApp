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
        var presenter = SummaryPresenter(view: self)
        return presenter
    }()
    
    private var spinner: Spinner?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutViews()
        view.backgroundColor = .white
        spinner = Spinner(superView: view)
    }
}

//MARK: - Layout
extension SummaryViewController {
    private func layoutViews() {
        view.addSubview(mainView)
        NSLayoutConstraint.activate([
            // MARK: - mainViewConstraints
            mainView.topAnchor.constraint(
                equalTo: view.layoutMarginsGuide.topAnchor,
                constant: 0
            ),
            mainView.leadingAnchor.constraint(
                equalTo: view.layoutMarginsGuide.leadingAnchor,
                constant: 0
            ),
            mainView.trailingAnchor.constraint(
                equalTo: view.layoutMarginsGuide.trailingAnchor,
                constant: 0
            ),
            mainView.bottomAnchor.constraint(
                equalTo: view.layoutMarginsGuide.bottomAnchor,
                constant: 0
            )
        ])
    }
}

extension SummaryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SummaryTableViewCell.identifier, for: indexPath) as! SummaryTableViewCell
        cell.setData(
            title: self.presenter.getArticleTitle(at: indexPath.row),
            image: self.presenter.getArticleImage(at: indexPath.row),
            description: self.presenter.getArticleDescription(at: indexPath.row)
        )
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.layer.masksToBounds = true
        let radius = cell.contentView.layer.cornerRadius
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: radius).cgPath
    }
}

extension SummaryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
}

extension SummaryViewController: SummaryPresenterDelegate {
    func didStartLoading() { self.spinner?.startLoading() }
    
    func didStopLoading() { self.spinner?.stopLoading() }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.mainView.reloadTableView()
        }
    }
}

extension SummaryViewController: UISearchTextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        presenter.getArticles(with: mainView.getTextfieldValue())
        return true;
    }
}