//
//  OverviewViewController.swift
//  M2Homework4
//
//  Created by Oleg Konstantinov on 08.11.2025.
//

import UIKit

class OverviewViewController: UIViewController {
    
    private lazy var model = CountryModel()
    
    //UILabel
    private lazy var titleLabel = UILabel().setupLabel(text: model.country, font: .title, color: .white)
    private lazy var subtitleLabel = UILabel().setupLabel(text: model.region, font: .normal, color: .white)
    private lazy var overviewLabel = UILabel().setupLabel(text: "Overview", font: .title)
    private lazy var aboutLabel = UILabel().setupLabel(text: model.description, font: .normal, color: .quickSilver, lines: 0)
    
    //UIButton
    private lazy var heartButton = setupButton(image: .heart, transform: false, corner: 15, tint: .englishVermillion, bgColor: .lightSilver, dimension: 30)
    private lazy var arrowButton = setupButton(action: backButtonAction,image: .arrow, transform: true, corner: 21.5, tint: .raisinBlack, bgColor: .white, dimension: 42)
    
    private lazy var bookingTripButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("Booking now", for: .normal)
        $0.backgroundColor = .raisinBlack
        $0.tintColor = .white
        $0.layer.cornerRadius = 20
        return $0
    }(UIButton(primaryAction: nil))
    
    //UIAction
    private lazy var backButtonAction: UIAction = UIAction {[weak self] _ in
        self?.navigationController?.popViewController(animated: true)
    }
    
    //Custom UIView
    private lazy var customView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addSubview(mainImageView)
        $0.addSubview(arrowButton)
        $0.addSubview(titleLabel)
        $0.addSubview(subtitleLabel)
        $0.addSubview(heartButton)
        NSLayoutConstraint.activate([
            mainImageView.leadingAnchor.constraint(equalTo: $0.leadingAnchor, constant: 0),
            mainImageView.trailingAnchor.constraint(equalTo: $0.trailingAnchor, constant: 0),
            mainImageView.topAnchor.constraint(equalTo: $0.topAnchor, constant: 0),
            mainImageView.bottomAnchor.constraint(equalTo: $0.bottomAnchor, constant: 0),
            
            arrowButton.topAnchor.constraint(equalTo: $0.topAnchor, constant: 20),
            arrowButton.leadingAnchor.constraint(equalTo: $0.leadingAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: $0.leadingAnchor, constant: 14),
            titleLabel.trailingAnchor.constraint(equalTo: $0.trailingAnchor, constant: -14),
            
            subtitleLabel.leadingAnchor.constraint(equalTo: $0.leadingAnchor, constant: 14),
            subtitleLabel.bottomAnchor.constraint(equalTo: $0.bottomAnchor, constant: -29),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            
            heartButton.trailingAnchor.constraint(equalTo: $0.trailingAnchor, constant: -14),
            heartButton.bottomAnchor.constraint(equalTo: $0.bottomAnchor, constant: -14),
        ])
        return $0
    }(UIView())
    
    //UIImageView
    private lazy var mainImageView: UIImageView = {
        $0.image = .portraitRock
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 26
        return $0
    }(UIImageView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = true
        view.addSubview(customView)
        view.addSubview(overviewLabel)
        view.addSubview(aboutLabel)
        view.addSubview(bookingTripButton)
        
        setupConstraints()
    }
    
    private func setupButton(
        action: UIAction? = nil,
        image: UIImage,
        transform: Bool,
        corner: CGFloat,
        tint: UIColor,
        bgColor: UIColor = .clear,
        dimension: CGFloat
    ) -> UIButton {
        
        let button = UIButton(primaryAction: action)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(image, for: .normal)
        if transform {
            button.imageView?.transform = CGAffineTransform(scaleX: -1, y: 1)
        }
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = bgColor
        button.layer.cornerRadius = corner
        button.tintColor = tint
        
        if let imageView = button.imageView {
            imageView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                button.widthAnchor.constraint(equalToConstant: dimension),
                button.heightAnchor.constraint(equalTo: button.widthAnchor, multiplier: 1),
                imageView.heightAnchor.constraint(equalToConstant: dimension / 1.9),
                imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1),
                imageView.centerXAnchor.constraint(equalTo: button.centerXAnchor),
                imageView.centerYAnchor.constraint(equalTo: button.centerYAnchor)
            ])
        }
        
        return button
    }
}

extension OverviewViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            customView.widthAnchor.constraint(equalToConstant: view.frame.width - 60),
            customView.heightAnchor.constraint(equalTo: customView.widthAnchor, multiplier: 1),
            
            customView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 83),
            customView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            customView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            overviewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            overviewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            overviewLabel.topAnchor.constraint(equalTo: customView.bottomAnchor, constant: 26),
            
            aboutLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            aboutLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            aboutLabel.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: 6),
            
            bookingTripButton.heightAnchor.constraint(equalToConstant: 60),
            bookingTripButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            bookingTripButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            bookingTripButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30)
        ])
    }
}
