//
//  ReasonsToStopCollectionViewCell.swift
//  QuitMate
//
//  Created by Саша Василенко on 02.03.2023.
//

import UIKit

class ReasonsToStopCollectionViewCell: UICollectionViewCell {
    static let identifier = "ReasonsToStopCollectionViewCell"
    
    
    private let label: UILabel = {
        let label = UILabel()
        label.setPoppinsFont(size: 18, style: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupContentView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setText(text: String) {
        label.text = text
    }
    
    func handleCellSelectedState() {
        contentView.backgroundColor = .systemGreen
    }
    
    func handleCellDeselectedState() {
        contentView.backgroundColor = .systemGray
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        layer.shadowPath = UIBezierPath(
//            roundedRect: bounds,
//            cornerRadius: 20
//        ).cgPath
//    }
    
}

private extension ReasonsToStopCollectionViewCell {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    func setupContentView() {
        contentView.addSubview(label)
        contentView.makeGlassEffectOnView(style: .extraLight)
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 7
//        contentView.layer.borderWidth = 3
//        contentView.layer.borderColor = UIColor.white.cgColor
    }
    
    
}
