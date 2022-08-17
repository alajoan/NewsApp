//
//  DSLabel.swift
//  ProjBornlogic
//
//  Created by Jonathan Alajoan Nascimento Rocha on 12/08/22.
//

import UIKit

public class DSLabel: UILabel {
    public enum LabelType {
        case title
        case descriptionText
        case detailText
        case detailTitle
        case author
        case date
    }
    
    var labelType: LabelType!
    
    private override init(frame: CGRect = .zero) {
        super.init(frame: frame)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public convenience init(labelType: LabelType? = .descriptionText, text: String = "", alignment: NSTextAlignment = .left) {
        self.init()
        self.labelType = labelType
        self.text = text
        self.textAlignment = alignment
        setConfiguration()
    }
}

//MARK: - Configurations Setup
extension DSLabel {
    private func setConfiguration() {
        setTextColor()
        setFontSize()
    }
    
    private func setTextColor() {
        self.textColor = UIColor(named: "TextColor")
    }
    
    private func setFontSize() {
        switch self.labelType {
        case .title:
            self.font = UIFont.systemFont(ofSize: 17, weight: .bold)
            break
        case .descriptionText:
            self.font = UIFont.systemFont(ofSize: 14, weight: .thin)
            break
        case .author:
            self.font = UIFont.systemFont(ofSize: 12, weight: .thin)
        case .detailTitle:
            self.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        case .detailText:
            self.font = UIFont.systemFont(ofSize: 20, weight: .regular)
            break
        case .date:
            self.font = UIFont.systemFont(ofSize: 14, weight: .thin)
            break
        default:
            self.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            break
        }
    }
}


