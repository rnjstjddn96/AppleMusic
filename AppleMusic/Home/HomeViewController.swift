//
//  ViewController.swift
//  AppleMusic
//
//  Created by 권성우 on 2020/10/06.
//  Copyright © 2020 swkwon. All rights reserved.
//

import UIKit
//Apple music
class HomeViewController: UIViewController {
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //AppleMusic
        collectionView.delegate = self
        collectionView.dataSource = self
        self.getLayout()
    }
    
    func getLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        let itemSpacing: CGFloat = 20
        let margin: CGFloat = 20
        let cellWidth = (collectionView.frame.width - itemSpacing - margin * 2) / 2.0
        let cellHeight = cellWidth * 1.3
        
        flowLayout.scrollDirection = .vertical
        flowLayout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        flowLayout.minimumLineSpacing = 20
        collectionView.contentInset = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
        
        collectionView.collectionViewLayout = flowLayout
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrackCollectionViewCell.id, for: indexPath) as? TrackCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // TODO: 곡 클릭시 플레이어뷰 띄우기
    }
}


