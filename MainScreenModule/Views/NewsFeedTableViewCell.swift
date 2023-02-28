//
//  NewsFeedTableView.swift
//  QuitMate
//
//  Created by Саша Василенко on 16.02.2023.
//

import UIKit

final class NewsFeedTableViewCell: UITableViewCell {
    enum NewsFeedTableViewCellLayouts {
        case leftToRight, rightToLeft
    }
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
        label.numberOfLines = 5
        return label
    }()
    // MARK: Creating stackviews
    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [arcticleHeadingLabel, articlePreviewLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    private lazy var rootStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = Constants.basicStackViewSpacing
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        contentView.addSubview(rootStackView)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(news: MainScreenNewsModuleModel) {
        articleImageView.image = UIImage(named: "Tokyo")
        arcticleHeadingLabel.text = news.title
        articlePreviewLabel.text = news.content
    }
    
    
    func setLayout(layout: NewsFeedTableViewCellLayouts) {
        let subviews = [articleImageView, labelsStackView]
        switch layout {
        case .leftToRight:
            let _ = subviews.map { rootStackView.addArrangedSubview($0) }
        case .rightToLeft:
            let _ = subviews.reversed().map { rootStackView.addArrangedSubview($0) }
        }
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
