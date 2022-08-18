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
    
    private lazy var imageView: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.makeRoundCorners(byRadius: 30)
        return image
    }()
    
    private lazy var title: DSLabel = {
        var title = DSLabel(labelType: .detailTitle, alignment: .center)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.numberOfLines = 0
        return title
    }()
    
    private lazy var publishedAt: DSLabel = {
        var publishedDate = DSLabel(labelType: .date, alignment: .center)
        publishedDate.translatesAutoresizingMaskIntoConstraints = false
        return publishedDate
    }()
    
    private lazy var content: DSLabel = {
        var fullDescription = DSLabel(labelType: .detailText)
        fullDescription.numberOfLines = 0
        fullDescription.translatesAutoresizingMaskIntoConstraints = false
        return fullDescription
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
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
        contentView.addSubview(imageView)
        contentView.addSubview(publishedAt)
        contentView.addSubview(content)
        contentView.addSubview(title)
        
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
            imageView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: 20
            ),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            
            //MARK: - title Constraints
            title.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            //MARK: - publishedAt Constraints
            publishedAt.topAnchor.constraint(
                equalTo: title.bottomAnchor,
                constant: 5
            ),
            publishedAt.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 10
            ),
            publishedAt.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -10
            ),
            
            //MARK: - fullDescription Constraints
            content.topAnchor.constraint(
                equalTo: publishedAt.bottomAnchor,
                constant: 10
            ),
            content.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 10
            ),
            content.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -10
            ),
            content.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -10
            )
        ])
    }
}

extension DetailsMainView {
    func setupViewData(title: String, content: String, image: UIImage, publishedAtBy: String){
        self.publishedAt.text = publishedAtBy
        self.imageView.image = image
        self.content.text = content
        self.title.text = title
    }
}
