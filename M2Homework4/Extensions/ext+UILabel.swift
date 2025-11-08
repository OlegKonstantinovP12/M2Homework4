//
//  ext+UILabel.swift
//  M2Homework4
//
//  Created by Oleg Konstantinov on 08.11.2025.
//

import UIKit

extension UILabel {
    func setupLabel(text: String, font: SizeFonts, color: UIColor = .black, lines: Int = 1) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        switch font {
        case .title:
            label.font = UIFont(name: "Inter-Bold", size: 18)
        case .subtitle:
            label.font = UIFont(name: "Inter-Medium", size: 12)
        case .normal:
            label.font = UIFont(name: "Inter-Regular", size: 12)
        case .userName:
            label.font = UIFont(name: "Inter-Bold", size: 16)
        }
        label.textColor = color
        label.numberOfLines = lines
        return label
    }
}
