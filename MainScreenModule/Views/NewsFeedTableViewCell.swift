//
//  NewsFeedTableView.swift
//  QuitMate
//
//  Created by Саша Василенко on 16.02.2023.
//

import UIKit

final class NewsFeedTableViewCell: UITableViewCell {
    static let identifier = "NewsFeedTableView"
    // MARK: Creating ui elements
    
    private let articleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 15
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private let arcticleHeadingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setHelveticaBoldFont(size: 14)
        label.textColor = UIColor(named: "ButtonsColor")
        label.numberOfLines = 2
        return label
    }()
    
    private let articlePreviewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setHelveticaBoldFont(size: 12)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [arcticleHeadingLabel, articlePreviewLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    //MARK: Creating stackviews
    private lazy var rootStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [articleImageView, labelsStackView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = Constants.basicStackViewSpacing
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        self.makeGlassEffectOnView(style: .light)
        self.backgroundColor = .clear
        contentView.addSubview(rootStackView)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(articleImage: UIImage, aricleHeading: String, articlePreviewText: String) {
        articleImageView.image = articleImage
        arcticleHeadingLabel.text = aricleHeading
        articlePreviewLabel.text = articlePreviewText
    }
}

private extension NewsFeedTableViewCell {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            rootStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.commonLayoutConstant),
            rootStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.commonLayoutConstant),
            rootStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.commonLayoutConstant),
            rootStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.commonLayoutConstant)
        ])
    }
}
