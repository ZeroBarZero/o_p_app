//
//  recommendationCollectionView.swift
//  o_p_app
//
//  Created by OOPSLA on 02/06/2019.
//  Copyright © 2019 haeun. All rights reserved.
//

import Foundation
import UIKit
import CenteredCollectionView

// 추천콜렉션뷰
class recommendationCollectionView : UIView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // didSelect에서 사용하는 delegate 정의
    var delegate : search_VC_delegate?
    
    let centeredCollectionViewFlowLayout = CenteredCollectionViewFlowLayout()
    let collectionView: UICollectionView
    
    let controlCenter = ControlCenterView()
    let cellPercentWidth: CGFloat = 0.6
    var scrollToEdgeEnabled = false
    
    var cellId = "Cell2"
    
    override init(frame: CGRect) {
        collectionView = UICollectionView(centeredCollectionViewFlowLayout: centeredCollectionViewFlowLayout)
        
        super.init(frame: frame)
        self.addSubview(collectionView)
        
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(
            recommendationCollectCell.self,
            forCellWithReuseIdentifier: String(describing: recommendationCollectCell.self)
        )
        centeredCollectionViewFlowLayout.minimumLineSpacing = 10
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        
        NSLayoutConstraint.activate([
            collectionView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
            collectionView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            collectionView.heightAnchor.constraint(equalToConstant: 300),
            ])

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        // configure layout
        centeredCollectionViewFlowLayout.itemSize = CGSize(
            width: self.bounds.width - 30,
            height: 300
        )
        
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath as IndexPath)!
        //delegate 로 nav로 뷰 이동.
        delegate?.navMoveDelegate(self, index: indexPath.row)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: recommendationCollectCell.self), for: indexPath) as! recommendationCollectCell

        return cell
    }
    
}
