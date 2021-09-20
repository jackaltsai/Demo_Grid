//
//  ViewController.swift
//  Demo_Grid
//
//  Created by 蔡忠翊 on 2021/9/20.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionViewLayout = generateLayout()
    }
    
    /* 格子狀照片牆(grid) */
    // item & group 的高度傳入 estimated，由 auto layout 自動計算高度
    // image view 比例設為 0.7，priority 要設成 999，否則會有 auto layout breaking constraint 的警告訊息
    
    func generateLayout() -> UICollectionViewLayout {
        let space: Double = 10
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(100))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(100))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        group.interItemSpacing = .fixed(space)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = space
        section.contentInsets = NSDirectionalEdgeInsets(top: space, leading: space, bottom: space, trailing: space)
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    
    // itemSize 設為 fractionalWidth(0.5) & fractionalWidth(0.5 / 0.7)，實現寬度是高度的 0.7 倍
    
//    func generateLayout() -> UICollectionViewLayout {
//        let space: Double = 5
//        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalWidth(0.5 / 0.7))
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//        item.contentInsets = NSDirectionalEdgeInsets(top: space, leading: space, bottom: space, trailing: space)
//                
//        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(100))
//                
//        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
//                
//        let section = NSCollectionLayoutSection(group: group)
//                
//        section.contentInsets = NSDirectionalEdgeInsets(top: space, leading: space, bottom: space, trailing: space)
//                
//        return UICollectionViewCompositionalLayout(section: section)
//    }
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CollectionViewCell.self)", for: indexPath) as! CollectionViewCell
        cell.imageView.image = UIImage(named: "Image\(indexPath.item + 1)")
        cell.label.text = "Image\(indexPath.item + 1)"
        return cell
    }
    
    
    
    
}
