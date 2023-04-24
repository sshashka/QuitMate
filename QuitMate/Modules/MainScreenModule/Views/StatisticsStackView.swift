//
//  StatisticsStackView.swift
//  QuitMate
//
//  Created by Саша Василенко on 24.04.2023.
//

import UIKit

class StatisticsView: UIView {
    let imageName: String
    let titleText: String
    let bottomText: String
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-SemiBold", size: 18)
        label.textColor = UIColor(named: Constants.labelColor)
        return label
    }()
    
    private let bottomLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-Light", size: 18)
        label.textColor = .gray
        return label
    }()
    
    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, bottomLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var rootStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imageView, labelsStackView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        return stackView
    }()
    
    required init(image: String, titleText: String, bottomText: String) {
        self.imageName = image
        self.titleText = titleText
        self.bottomText = bottomText
        super.init(frame: .zero)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(image: String, titleText: String, bottomText: String) {
        imageView.image = UIImage(named: image)
        titleLabel.text = titleText
        bottomLabel.text = bottomText
        setupConstraints()
    }
    
    private func setupConstraints() {
        self.addSubview(rootStackView)
        imageView.image = UIImage(named: imageName)
        NSLayoutConstraint.activate([
            rootStackView.topAnchor.constraint(equalTo: self.topAnchor),
            rootStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            rootStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            rootStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
