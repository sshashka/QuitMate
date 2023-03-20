//
//  ResonsToStopView.swift
//  QuitMate
//
//  Created by Саша Василенко on 02.03.2023.
//

import UIKit
import SwiftUI

//let ahaha = ["Nicotine addiction", "Stress", "Social situations", "Habits and routines", "Weight gain", "Boredom", "Lack of support", "Alcohol consumption", "Advertising", "Low mood", "Peer pressure", "Mental health conditions", "Lack of information", "Feeling overwhelmed", "Lack of alternatives", "The belief that smoking is enjoyable", "Access to cigarettes", "Lack of commitment", "Lack of self-efficacy", "Fear of failure"]

final class ReasonsToStopViewController: UIViewController {
    private var reasonsToStopCollectionView: UICollectionView!
    var presenter: ReasonsToStopPresenterProtocol?
    private let doneButton: UIButton = {
        let button = UIButton()
        button.setTitle("Done", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(named: Constants.greenButtonColor)
        button.layer.cornerRadius = 26
        button.isEnabled = false
        return button
    }()
    
    private lazy var rootStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [reasonsToStopCollectionView, doneButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()
    
    private var selectedItems = Set<Int>()
    private var reasonsToStopArray: [String] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.setBackground()
        setupCollectionView()
        view.addSubview(rootStackView)
        setupConstraints()
    }
}

private extension ReasonsToStopViewController {
    func setupLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(100), heightDimension: .fractionalHeight(0.8))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = NSCollectionLayoutSpacing.fixed(10)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8)
        
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
    
    
    func setupCollectionView() {
        reasonsToStopCollectionView = UICollectionView(frame: .zero, collectionViewLayout: setupLayout())
        reasonsToStopCollectionView.translatesAutoresizingMaskIntoConstraints = false
        reasonsToStopCollectionView.allowsMultipleSelection = true
        reasonsToStopCollectionView.register(ReasonsToStopCollectionViewCell.self, forCellWithReuseIdentifier: ReasonsToStopCollectionViewCell.identifier)
        reasonsToStopCollectionView.dataSource = self
        reasonsToStopCollectionView.backgroundColor = .clear
        reasonsToStopCollectionView.allowsMultipleSelection = true
        reasonsToStopCollectionView.delegate = self
        
        presenter?.showArrayOfReasons()
//        view.addSubview(reasonsToStopCollectionView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            rootStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.commonLayoutConstant),
            rootStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            rootStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            rootStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -Constants.commonLayoutConstant),
            
            doneButton.heightAnchor.constraint(equalToConstant: view.frame.height/15),
            // fix button width
            doneButton.widthAnchor.constraint(equalToConstant: view.frame.width - 20)
        ])
    }
}

extension ReasonsToStopViewController: ReasonsToStopViewProtocol {
    func showReasons(reasons: [String]) {
        self.reasonsToStopArray = reasons
        reasonsToStopCollectionView.reloadData()
    }
}

extension ReasonsToStopViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReasonsToStopCollectionViewCell.identifier, for: indexPath) as? ReasonsToStopCollectionViewCell
        guard let cell = cell else { return UICollectionViewCell() }
        cell.setText(text: reasonsToStopArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reasonsToStopArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        if selectedItems.count >= 10 {
            return false
        }
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedItems.insert(indexPath.item)
        let cell = collectionView.cellForItem(at: indexPath) as? ReasonsToStopCollectionViewCell
        guard let cell = cell else { return }
        cell.handleCellSelectedState()
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        selectedItems.remove(indexPath.item)
        let cell = collectionView.cellForItem(at: indexPath) as? ReasonsToStopCollectionViewCell
        guard let cell = cell else { return }
        cell.handleCellDeselectedState()
    }
}

struct StopViewControllerRepresentable: UIViewControllerRepresentable {

    func makeUIViewController(context: Context) -> some UIViewController {
        return ReasonsToStopViewController()
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

    }
}

struct StopViewControllerPreview: PreviewProvider {
    static var previews: some View {
        StopViewControllerRepresentable()
    }
}
