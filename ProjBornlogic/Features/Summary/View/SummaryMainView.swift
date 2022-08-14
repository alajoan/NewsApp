//
//  SummaryMainView.swift
//  ProjBornlogic
//
//  Created by Jonathan Alajoan Nascimento Rocha on 11/08/22.
//

import Foundation
import UIKit

final class SummaryMainView: UIView {
    lazy var tableView: UITableView = {
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
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - Layout
extension SummaryMainView {
    private func layoutViews() {
        addSubview(tableView)
        NSLayoutConstraint.activate([
            // MARK: - tableViewConstraints
            tableView.topAnchor.constraint(
                equalTo: topAnchor,
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
