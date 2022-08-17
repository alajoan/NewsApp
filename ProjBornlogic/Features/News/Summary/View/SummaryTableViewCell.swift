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
    
    private lazy var titleLabel: DSLabel = {
        var title = DSLabel(labelType: .title)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.numberOfLines = 0
        return title
    }()
    
    private lazy var summaryImageView: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.makeRoundCorners(byRadius: 10)
        return image
    }()
    
    private lazy var descriptionLabel: DSLabel = {
        var description = DSLabel(labelType: .descriptionText)
        description.translatesAutoresizingMaskIntoConstraints = false
        description.numberOfLines = 0
        return description
    }()
    
    private lazy var authorLabel: DSLabel = {
        var author = DSLabel(labelType: .author, alignment: .center)
        author.translatesAutoresizingMaskIntoConstraints = false
        author.numberOfLines = 0
        return author
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
        self.summaryImageView.image = nil
        self.titleLabel.text = nil
        self.descriptionLabel.text = nil
    }
}

//MARK: - functions
extension SummaryTableViewCell {
    func setData(title: String, image: UIImage, description: String, author: String) {
        self.titleLabel.text = title
        self.summaryImageView.image = image
        self.descriptionLabel.text = description
        self.authorLabel.text = author
    }
}

extension SummaryTableViewCell {
    
    private func makeShadows() {
        backgroundColor = .clear
        holder.layer.masksToBounds = false
        holder.layer.shadowOpacity = 0.13
        holder.layer.shadowRadius = 4
        holder.layer.shadowOffset = CGSize(width: 0, height: 0)
        holder.layer.shadowColor = UIColor.black.cgColor
        holder.backgroundColor = .white
        holder.layer.cornerRadius = 8
    }
    
    private func layoutView() {
        makeShadows()
        
        //MARK: - Subviews
        contentView.addSubview(holder)
        holder.addSubview(titleLabel)
        holder.addSubview(summaryImageView)
        holder.addSubview(descriptionLabel)
        holder.addSubview(authorLabel)

        NSLayoutConstraint.activate([
            
            //MARK: - holderConstraints
            holder.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            holder.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            holder.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            holder.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            //MARK: - summaryImageConstraints
            summaryImageView.heightAnchor.constraint(equalToConstant: 110),
            summaryImageView.widthAnchor.constraint(equalToConstant: 100),
            summaryImageView.centerYAnchor.constraint(equalTo: holder.centerYAnchor, constant: -15),
            summaryImageView.trailingAnchor.constraint(
                equalTo: holder.trailingAnchor,
                constant: -10
            ),
            
            //MARK: - AuthorLabelConstraints
            authorLabel.topAnchor.constraint(
                equalTo: summaryImageView.bottomAnchor,
                constant: 5
            ),
            authorLabel.bottomAnchor.constraint(
                equalTo: holder.bottomAnchor,
                constant: -5
            ),
            authorLabel.trailingAnchor.constraint(
                equalTo: holder.trailingAnchor,
                constant: -10
            ),
            authorLabel.widthAnchor.constraint(greaterThanOrEqualTo: summaryImageView.widthAnchor),
            authorLabel.leadingAnchor.constraint(
                equalTo: titleLabel.trailingAnchor,
                constant: 10
            ),
            
            
            //MARK: - summaryTitleConstraints
            titleLabel.leadingAnchor.constraint(
                equalTo: holder.leadingAnchor,
                constant: 10
            ),
            titleLabel.trailingAnchor.constraint(
                equalTo: summaryImageView.leadingAnchor,
                constant: -10
            ),
            titleLabel.topAnchor.constraint(
                equalTo: holder.topAnchor,
                constant: 10
            ),
            
            //MARK: - summaryDescriptionConstraints
            descriptionLabel.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor,
                constant: 0
            ),
            descriptionLabel.leadingAnchor.constraint(
                equalTo: holder.leadingAnchor,
                constant: 10
            ),
            descriptionLabel.trailingAnchor.constraint(
                equalTo: summaryImageView.leadingAnchor,
                constant: -10
            ),
            descriptionLabel.bottomAnchor.constraint(
                equalTo: holder.bottomAnchor,
                constant: -10
            ),
            descriptionLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 70)
        ])
    }
}
