//
//  OverviewViewController.swift
//  M2Homework4
//
//  Created by Oleg Konstantinov on 08.11.2025.
//

import UIKit

class OverviewViewController: UIViewController {
    private lazy var model = CountryModel()
    
    private lazy var titleLabel = UILabel().setupLabel(text: model.country, font: .title, color: .white)
    private lazy var subtitleLabel = UILabel().setupLabel(text: model.region, font: .normal, color: .white)
    private lazy var overviewLabel = UILabel().setupLabel(text: "Overview", font: .title, lines: 0)
    private lazy var aboutLabel = UILabel().setupLabel(text: model.description, font: .normal, lines: 0)
    
    private lazy var customView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addSubview(mainImageView)
        $0.addSubview(arrowButton)
        $0.addSubview(titleLabel)
        $0.addSubview(subtitleLabel)
        NSLayoutConstraint.activate([
            mainImageView.leadingAnchor.constraint(equalTo: $0.leadingAnchor, constant: 0),
            mainImageView.trailingAnchor.constraint(equalTo: $0.trailingAnchor, constant: 0),
            mainImageView.topAnchor.constraint(equalTo: $0.topAnchor, constant: 0),
            mainImageView.bottomAnchor.constraint(equalTo: $0.bottomAnchor, constant: 0),
            arrowButton.widthAnchor.constraint(equalToConstant: 42),
            arrowButton.heightAnchor.constraint(equalTo: arrowButton.widthAnchor, multiplier: 1),
            arrowButton.topAnchor.constraint(equalTo: $0.topAnchor, constant: 20),
            arrowButton.leadingAnchor.constraint(equalTo: $0.leadingAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: $0.leadingAnchor, constant: 14),
            titleLabel.trailingAnchor.constraint(equalTo: $0.trailingAnchor, constant: -14),
            
            subtitleLabel.leadingAnchor.constraint(equalTo: $0.leadingAnchor, constant: 14),
            subtitleLabel.bottomAnchor.constraint(equalTo: $0.bottomAnchor, constant: -29),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8)
        ])
        return $0
    }(UIView())
    private lazy var mainImageView: UIImageView = {
        $0.image = .portraitRock
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 26
        return $0
    }(UIImageView())
    
    private lazy var arrowButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(.arrow, for: .normal)
        $0.imageView?.transform = CGAffineTransform(scaleX: -1, y: 1)
        $0.imageView?.contentMode = .scaleAspectFit
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 21.5
        $0.tintColor = .raisinBlack
        
        if let imageView = $0.imageView {
            imageView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                imageView.widthAnchor.constraint(equalToConstant: 20),
                imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1),
                imageView.centerXAnchor.constraint(equalTo: $0.centerXAnchor),
                imageView.centerYAnchor.constraint(equalTo: $0.centerYAnchor)
            ])
        }
        
        return $0
    }(UIButton(primaryAction: backButtonAction))
    
    private lazy var backButtonAction: UIAction = UIAction {[weak self] _ in
        self?.navigationController?.popViewController(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = true
        view.addSubview(customView)
        view.addSubview(overviewLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            customView.widthAnchor.constraint(equalToConstant: view.frame.width - 60),
            customView.heightAnchor.constraint(equalTo: customView.widthAnchor, multiplier: 1),

            customView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 83),
            customView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            customView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            overviewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            overviewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            overviewLabel.topAnchor.constraint(equalTo: customView.bottomAnchor, constant: 26)
        ])
    }
    deinit {
        print("deinit")
    }


}
//26
