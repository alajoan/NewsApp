//
//  DetailsMainView.swift
//  ProjBornlogic
//
//  Created by Jonathan Alajoan Nascimento Rocha on 15/08/22.
//

import Foundation
import UIKit

final class DetailsMainView: UIView {
    
    private lazy var scrollView: UIScrollView = {
        var scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private lazy var contentView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var image: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var title: DSLabel = {
        var title = DSLabel(labelType: .title)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var publishedAt: DSLabel = {
        var publishedDate = DSLabel(labelType: .date)
        publishedDate.translatesAutoresizingMaskIntoConstraints = false
        return publishedDate
    }()
    
    private lazy var fullDescription: DSLabel = {
        var fullDescription = DSLabel(labelType: .fullDescriptionText)
        fullDescription.translatesAutoresizingMaskIntoConstraints = false
        return fullDescription
    }()
    
    init() {
        super.init(frame: .zero)
        layoutViews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DetailsMainView {
    private func layoutViews() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(image)
        contentView.addSubview(title)
        contentView.addSubview(publishedAt)
        contentView.addSubview(fullDescription)
        NSLayoutConstraint.activate([
            
            //MARK: - ScrollView Constraints
            scrollView.centerXAnchor.constraint(equalTo: centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: widthAnchor),
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            //MARK: - ContentView Constraints
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            //MARK: - ImageView Constraints
            image.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: 5
            ),
            image.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            image.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            image.heightAnchor.constraint(greaterThanOrEqualToConstant: 200),
            
            //MARK: - title Constraints
            title.topAnchor.constraint(
                equalTo: image.bottomAnchor,
                constant: 0
            ),
            title.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 10
            ),
            title.trailingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 10
            ),
            
            //MARK: - publishedAt Constraints
            
            //MARK: - fullDescription Constraints
            
                    ])
    }
}
