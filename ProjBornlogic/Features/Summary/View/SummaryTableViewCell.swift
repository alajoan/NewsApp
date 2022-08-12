//
//  SummaryTableViewCell.swift
//  ProjBornlogic
//
//  Created by Jonathan Alajoan Nascimento Rocha on 11/08/22.
//

import UIKit

final class SummaryTableViewCell: UITableViewCell {
    
    static let identifier = "summaryCell"
    
    private lazy var holder: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var summaryTitle: DSLabel = {
        var title = DSLabel(labelType: .title)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.numberOfLines = 0
        return title
    }()
    
    private lazy var summaryImage: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.sizeToFit()
        image.makeRoundCorners(byRadius: 10)
        return image
    }()
    
    private lazy var summaryDescription: DSLabel = {
        var description = DSLabel(labelType: .descriptionText)
        description.translatesAutoresizingMaskIntoConstraints = false
        description.numberOfLines = 0
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
       
        
        let shadowPath = UIBezierPath(rect: self.bounds)
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0.5)
        self.layer.shadowOpacity = 0.2
        self.layer.shadowPath = shadowPath.cgPath
        
        selectionStyle = .none
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 50, left: 10, bottom: 50, right: 10))
        contentView.backgroundColor = .white
        contentView.addSubview(summaryTitle)
        contentView.addSubview(summaryImage)
        contentView.addSubview(summaryDescription)

        NSLayoutConstraint.activate([
            //MARK: - summaryImageConstraints
            summaryImage.heightAnchor.constraint(equalToConstant: 132),
            summaryImage.widthAnchor.constraint(equalToConstant: 118),
            summaryImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            summaryImage.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -10
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
                constant: 0
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
