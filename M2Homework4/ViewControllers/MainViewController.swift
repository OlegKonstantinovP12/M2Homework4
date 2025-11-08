//
//  ViewController.swift
//  M2Homework4
//
//  Created by Oleg Konstantinov on 07.11.2025.
//

import UIKit

class MainViewController: UIViewController {
    //UILabel
    private lazy var model = CountryModel()
    private lazy var welcomeLabel = UILabel().setupLabel(text: "welcome", font: .normal, color: .quickSilver)
    private lazy var userNameLabel = UILabel().setupLabel(text: "Oleg", font: .userName)
    private lazy var popularTripLabel = setupTitles(title: "Popular Trip")
    private lazy var titleTrip = UILabel().setupLabel(text: model.country, font: .title)
    private lazy var subTitleTrip = UILabel().setupLabel(text: model.region, font: .normal, color: .quickSilver)
    private lazy var popularCategoryLabel = setupTitles(title: "Popular Category")
    private lazy var titleCategory = UILabel().setupLabel(text: "Mountains", font: .title)
    private lazy var subtitleCategory = UILabel().setupLabel(text: model.country, font: .normal, color: .quickSilver)
    
    
    //UIImageView
    private lazy var avatarImage = setupImageView(image: .avatar, cornerRadius: 10, size: 45)
    
    //UIStackView
    private lazy var mainStack: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.spacing = 10
        $0.alignment = .center
        $0.distribution = .fillProportionally
        return $0
    }(UIStackView())
    
    private lazy var textStack: UIStackView = {
        $0.axis = .vertical
        $0.alignment = .leading
        return $0
    }(UIStackView())
    
    //UITextField
    private lazy var searchTextField: UITextField = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.placeholder = "search your trip ..."
        $0.font = .systemFont(ofSize: 14)
        $0.backgroundColor = .white
        $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        $0.layer.masksToBounds = false
        $0.layer.cornerRadius = 18
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.1
        $0.layer.shadowOffset = .zero
        $0.layer.shadowRadius = 10
        
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        $0.leftViewMode = .always
        $0.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        $0.rightViewMode = .always
        
        return $0
    }(UITextField())
    
    //UIButton
    private lazy var bellButton = setButton(image: .bell, tintColor: .lightSilver, radius: 0, heightButton: 20, heightImage: 20)
    private lazy var searchButton = setButton(image: .lens, tintColor: .white, bgColor: .raisinBlack, radius: 16, heightButton: 50, heightImage: 16)
    private lazy var openTripArrowButton = setButton(action: action, image: .arrow, radius: 0, heightButton: 20, heightImage: 20)
    private lazy var openCategoryArrowButton = setButton(image: .arrow, radius: 0, heightButton: 20, heightImage: 20)
    private lazy var heartButton = setButton(image: .heart, tintColor: .englishVermillion, radius: 0, heightButton: 24, heightImage: 24)
    //UIAction
    private lazy var action: UIAction = UIAction { _ in
        let overviewVC = OverviewViewController()
        self.navigationController?.pushViewController(overviewVC, animated: true)
    }
    
    //UIView
    private lazy var popularTripView: UIView = {
        let imageView = UIImageView(image: .portraitRock)
        $0.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        //isUserInteractionEnabled обязателен если кнопка располагается в UIImageView, иначе кнопка будет под слоем ImageView
        // и не будет нажиматься
        imageView.isUserInteractionEnabled = true
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        //позволяет сместить изображение внутри контейнера UIImageView
        imageView.layer.contentsRect = CGRect(x: 0, y: -0.31, width: 1, height: 1.1)
        imageView.layer.cornerRadius = 26
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 18
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.1
        $0.layer.shadowOffset = .zero
        $0.layer.shadowRadius = 10
        $0.addSubview(imageView)
        imageView.addSubview(heartButton)
        $0.addSubview(titleTrip)
        $0.addSubview(subTitleTrip)
        $0.addSubview(openTripArrowButton)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: $0.leadingAnchor, constant: 11),
            imageView.trailingAnchor.constraint(equalTo: $0.trailingAnchor, constant: -11),
            imageView.topAnchor.constraint(equalTo: $0.topAnchor, constant: 11),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.5),
            
            heartButton.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -14),
            heartButton.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 14),
            
            titleTrip.leadingAnchor.constraint(equalTo: $0.leadingAnchor, constant: 11),
            titleTrip.trailingAnchor.constraint(equalTo: $0.trailingAnchor, constant: -11),
            titleTrip.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 13),
            
            subTitleTrip.leadingAnchor.constraint(equalTo: $0.leadingAnchor, constant: 11),
            subTitleTrip.trailingAnchor.constraint(equalTo: $0.trailingAnchor, constant: 11),
            subTitleTrip.topAnchor.constraint(equalTo: titleTrip.bottomAnchor, constant: 4),
            
            openTripArrowButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 11),
            openTripArrowButton.trailingAnchor.constraint(equalTo: $0.trailingAnchor, constant: -11),
            $0.bottomAnchor.constraint(equalTo: subTitleTrip.bottomAnchor, constant: 11)
            
        ])
        return $0
    }(UIView())
    
    private lazy var popularCategoryView: UIView = {
        let imageView = UIImageView(image: .landscapeRock)
        
        $0.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 18
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.1
        $0.layer.shadowOffset = .zero
        $0.layer.shadowRadius = 10
        
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 26
        
        $0.addSubview(imageView)
        $0.addSubview(titleCategory)
        $0.addSubview(subtitleCategory)
        $0.addSubview(openCategoryArrowButton)
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 79),
            imageView.widthAnchor.constraint(equalToConstant: 84),
            imageView.leadingAnchor.constraint(equalTo: $0.leadingAnchor, constant: 8),
            imageView.topAnchor.constraint(equalTo: $0.topAnchor, constant: 8),
            imageView.bottomAnchor.constraint(equalTo: $0.bottomAnchor, constant: -8),
            
            titleCategory.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 12),
            titleCategory.topAnchor.constraint(equalTo: $0.topAnchor, constant: 19),
            
            subtitleCategory.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 12),
            subtitleCategory.topAnchor.constraint(equalTo: titleCategory.bottomAnchor, constant: 13),
            
            openCategoryArrowButton.topAnchor.constraint(equalTo: $0.topAnchor, constant: 20),
            openCategoryArrowButton.trailingAnchor.constraint(equalTo: $0.trailingAnchor, constant: -20),
        ])
        
        return $0
    }(UIView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white
        view.addSubview(mainStack)
        
        mainStack.addArrangedSubview(avatarImage)
        mainStack.addArrangedSubview(textStack)
        mainStack.addArrangedSubview(bellButton)
        
        textStack.addArrangedSubview(welcomeLabel)
        textStack.addArrangedSubview(userNameLabel)
        
        view.addSubview(searchTextField)
        view.addSubview(searchButton)
        view.addSubview(popularTripLabel)
        
        view.addSubview(popularTripView)
        view.addSubview(popularCategoryLabel)
        view.addSubview(popularCategoryView)
        
        setupConstraints()
        
    }
    
    private func setupImageView(image: UIImage, cornerRadius: CGFloat, size: CGFloat, tintColor: UIColor = .clear, bgColor: UIColor = .clear) -> UIImageView {
        let imageView = UIImageView()
        imageView.isUserInteractionEnabled = true
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = cornerRadius
        imageView.tintColor = tintColor
        imageView.widthAnchor.constraint(equalToConstant: size).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1).isActive = true
        imageView.backgroundColor = bgColor
        
        return imageView
    }
    
    private func setButton(
        action: UIAction? = nil,
        image: UIImage,
        tintColor: UIColor = .quickSilver,
        bgColor: UIColor = .clear,
        radius: CGFloat,
        heightButton: CGFloat,
        heightImage: CGFloat
    ) -> UIButton {
        
        let button = UIButton(primaryAction: action)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(image, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = tintColor
        button.backgroundColor = bgColor
        button.layer.cornerRadius = radius
        
        if let imageView = button.imageView {
            imageView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                button.heightAnchor.constraint(equalToConstant: heightButton),
                button.widthAnchor.constraint(equalTo: button.heightAnchor, multiplier: 1),
                
                imageView.widthAnchor.constraint(equalToConstant: heightImage),
                imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1),
                imageView.centerXAnchor.constraint(equalTo: button.centerXAnchor),
                imageView.centerYAnchor.constraint(equalTo: button.centerYAnchor)
            ])
            
        }
        return button
    }
    
    private func setupTitles(title: String) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        let titleLabel = UILabel().setupLabel(text: title, font: .title)
        let seeAllLabel = UILabel().setupLabel(text: "see all", font: .subtitle, color: .quickSilver)
        view.addSubview(titleLabel)
        view.addSubview(seeAllLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            titleLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            seeAllLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            seeAllLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            seeAllLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])
        return view
    }
}

extension MainViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            mainStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),

            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            searchTextField.trailingAnchor.constraint(equalTo: searchButton.leadingAnchor, constant: -10),
            searchTextField.topAnchor.constraint(equalTo: mainStack.bottomAnchor, constant: 30),
            searchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            searchButton.topAnchor.constraint(equalTo: mainStack.bottomAnchor, constant: 30),
            searchButton.centerXAnchor.constraint(equalTo: searchButton.centerXAnchor),
            searchButton.centerYAnchor.constraint(equalTo: searchButton.centerYAnchor),
            
            popularTripLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            popularTripLabel.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 50),
            popularTripLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            popularTripView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            popularTripView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            popularTripView.topAnchor.constraint(equalTo: popularTripLabel.bottomAnchor, constant: 21),
            
            popularCategoryLabel.topAnchor.constraint(equalTo: popularTripView.bottomAnchor, constant: 50),
            popularCategoryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            popularCategoryLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            popularCategoryView.topAnchor.constraint(equalTo: popularCategoryLabel.bottomAnchor, constant: 21),
            popularCategoryView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            popularCategoryView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
            
        ])
    }
}
