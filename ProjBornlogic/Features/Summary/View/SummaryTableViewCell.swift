//
//  SummaryTableViewCell.swift
//  ProjBornlogic
//
//  Created by Jonathan Alajoan Nascimento Rocha on 11/08/22.
//

import UIKit

final class SummaryTableViewCell: UITableViewCell {
    
    static let identifier = "summaryCell"
    
    private lazy var summaryTitle: UILabel = {
        var title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var summaryImage: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var summaryDescription: UILabel = {
        var description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutView()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        self.summaryImage.image = nil
        self.summaryTitle.text = nil
        self.summaryDescription.text = nil
    }
}

//MARK: - functions
extension SummaryTableViewCell {
    func setData(title: String, image: UIImage, description: String) {
        self.summaryTitle.text = title
        self.summaryImage.image = image
        self.summaryDescription.text = description
    }
}

extension SummaryTableViewCell {
    
    private func layoutView() {
        selectionStyle = .none
        contentView.backgroundColor = .white
        contentView.addSubview(summaryTitle)
        contentView.addSubview(summaryImage)
        contentView.addSubview(summaryDescription)

        NSLayoutConstraint.activate([
            
            //MARK: - summaryImageConstraints
            summaryImage.heightAnchor.constraint(equalToConstant: 100),
            summaryImage.widthAnchor.constraint(equalToConstant: 118),
            summaryImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            summaryImage.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -5
            ),
            
            
            //MARK: - summaryTitleConstraints
            summaryTitle.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 10
            ),
            summaryTitle.trailingAnchor.constraint(
                equalTo: summaryImage.leadingAnchor,
                constant: -10
            ),
            summaryTitle.topAnchor.constraint(
                equalTo: topAnchor,
                constant: 10
            ),
            
            //MARK: - summaryDescriptionConstraints
            summaryDescription.topAnchor.constraint(
                equalTo: summaryTitle.bottomAnchor,
                constant: 10
            ),
            summaryDescription.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 10
            ),
            summaryDescription.trailingAnchor.constraint(
                equalTo: summaryImage.leadingAnchor,
                constant: -10
            ),
            summaryDescription.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -10
            )
        ])
    }
}
