//
//  SummaryMainView.swift
//  ProjBornlogic
//
//  Created by Jonathan Alajoan Nascimento Rocha on 11/08/22.
//

import Foundation
import UIKit

final class SummaryMainView: UIView {
    
    private lazy var textField: UISearchTextField = {
        let textfield = UISearchTextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "Search for news"
        return textfield
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(
            SummaryTableViewCell.self,
            forCellReuseIdentifier: SummaryTableViewCell.identifier
        )
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.preservesSuperviewLayoutMargins = false
        return tableView
    }()
    
    init() {
        super.init(frame: .zero)
        layoutViews()
    }
    
    convenience init(delegate: SummaryViewController)
    {
        self.init()
        tableView.delegate = delegate
        tableView.dataSource = delegate
        textField.delegate = delegate
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - Layout
extension SummaryMainView {
    private func layoutViews() {
        addSubview(textField)
        addSubview(tableView)
        NSLayoutConstraint.activate([
            
            //MARK: - TextField Constraints
            textField.topAnchor.constraint(
                equalTo: topAnchor,
                constant: 5
            ),
            textField.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 20
            ),
            textField.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -20
            ),
            
            // MARK: - tableViewConstraints
            tableView.topAnchor.constraint(
                equalTo: textField.bottomAnchor,
                constant: 5
            ),
            tableView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 5
            ),
            tableView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -5
            ),
            tableView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -5
            )
        ])
    }
}

//MARK: - Functions
extension SummaryMainView {
    func reloadTableView() {
        tableView.reloadData()
    }
    
    func getTextfieldValue() -> String {
        guard let text = textField.text else { return "" }
        return text
    }
}
