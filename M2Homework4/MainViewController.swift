//
//  ViewController.swift
//  M2Homework4
//
//  Created by Oleg Konstantinov on 07.11.2025.
//

import UIKit

class MainViewController: UIViewController {
    
    private lazy var rootStackView = setupStackView()
    private lazy var topStackView = setupStackView(axis: .horizontal, spacing: 10)
    private lazy var topTextStackView = setupStackView()
    
    private lazy var avatarImage = setupImageView(image: .avatar, cornerRadius: 10, size: 45)
    private lazy var welcomeLabel = setupLabel(text: "welcome")
    private lazy var userNameLabel = setupLabel(text: "Oleg", font: .boldSystemFont(ofSize: 16))

    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(rootStackView)
        rootStackView.addArrangedSubview(topStackView)
        topStackView.addArrangedSubview(avatarImage)
        topStackView.addArrangedSubview(topTextStackView)
        topTextStackView.addArrangedSubview(welcomeLabel)
        topTextStackView.addArrangedSubview(userNameLabel)

        
        NSLayoutConstraint.activate([
            rootStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            rootStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            rootStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),

        ])

    }

    private func setupLabel(text: String, font: UIFont = .systemFont(ofSize: 12), color: UIColor = .black) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.font = font
        label.textColor = color
        return label
    }

    private func setupImageView(image: UIImage, cornerRadius: CGFloat, size: CGFloat) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = cornerRadius
        imageView.widthAnchor.constraint(equalToConstant: size).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1).isActive = true
        
        return imageView
    }
    private func setupViews() -> UIView {
        let customView = UIView()
        customView.translatesAutoresizingMaskIntoConstraints = false
        customView.layer.shadowColor = UIColor.black.cgColor
        customView.layer.shadowOpacity = 1
        customView.layer.shadowOffset = .zero
        customView.layer.shadowRadius = 10
        return customView
    }
    
    private func setupStackView(axis: NSLayoutConstraint.Axis = .vertical, distribution: UIStackView.Distribution = .fill, alignment: UIStackView.Alignment = .leading, spacing: CGFloat = 0) -> UIStackView {
        let customStackView = UIStackView()
        customStackView.translatesAutoresizingMaskIntoConstraints = false
        customStackView.axis = axis
        customStackView.distribution = distribution
        customStackView.alignment = alignment
        customStackView.spacing = spacing
        return customStackView
    }
    
    private func createCustomImage() -> UIImageView {
        
        return UIImageView()
    }
}

