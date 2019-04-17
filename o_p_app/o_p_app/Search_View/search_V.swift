//
//  search_V.swift
//  o_p_app
//
//  Created by OOPSLA on 17/03/2019.
//  Copyright © 2019 haeun. All rights reserved.
//

import Foundation
import UIKit
import TagListView

class search_V : UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = .white
        initView()
        
    }
    func initView(){
        // addsubview
        self.addSubview(scrollView)
        scrollView.addSubview(recommendationLabel)
        scrollView.addSubview(recommendationCollectView)
        scrollView.addSubview(recommendationUserLocateLabel)
        scrollView.addSubview(recommendationUserLocateCollectView)
        scrollView.addSubview(categoryRecomenLabel)
        scrollView.addSubview(categoryRecomenBtn)
        scrollView.addSubview(categoryRecomendCollectView)
        
        
        // constraint
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            
            recommendationLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            recommendationLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Defaull_style.defaultPadding),
            recommendationLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Defaull_style.defaultPadding),
            
            recommendationCollectView.topAnchor.constraint(equalTo: recommendationLabel.bottomAnchor, constant: 10),
            recommendationCollectView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            recommendationCollectView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            recommendationCollectView.heightAnchor.constraint(equalToConstant: 150),
            
            recommendationUserLocateLabel.topAnchor.constraint(equalTo: recommendationCollectView.bottomAnchor, constant: 10),
            recommendationUserLocateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Defaull_style.defaultPadding),
            recommendationUserLocateLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Defaull_style.defaultPadding),

            
            recommendationUserLocateCollectView.topAnchor.constraint(equalTo: recommendationUserLocateLabel.bottomAnchor, constant: 10),
            recommendationUserLocateCollectView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            recommendationUserLocateCollectView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            recommendationUserLocateCollectView.heightAnchor.constraint(equalToConstant: 150),

            
            categoryRecomenLabel.topAnchor.constraint(equalTo: recommendationUserLocateCollectView.bottomAnchor, constant: 10),
            categoryRecomenLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Defaull_style.defaultPadding),
            categoryRecomenLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Defaull_style.defaultPadding),
            
            categoryRecomenBtn.centerYAnchor.constraint(equalTo: categoryRecomenLabel.centerYAnchor),
            categoryRecomenBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Defaull_style.defaultPadding),
            categoryRecomenBtn.leadingAnchor.constraint(lessThanOrEqualTo: categoryRecomenLabel.trailingAnchor, constant: 0),

            categoryRecomendCollectView.topAnchor.constraint(equalTo: categoryRecomenLabel.bottomAnchor, constant: 10),
            categoryRecomendCollectView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Defaull_style.defaultPadding),
            categoryRecomendCollectView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Defaull_style.defaultPadding),
            categoryRecomendCollectView.heightAnchor.constraint(equalToConstant: 200),
            categoryRecomendCollectView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -100)
            ])
        
        //test data
        let testData = search_Model(name: "하은")
        recommendationLabel.text = testData.name + " 님을 위한 스터디입니다."

    }
    let scrollView : UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()

    let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "탐색하기"
        label.textAlignment = .left
        label.textColor = Defaull_style.mainTitleColor
        label.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let recommendationLabel : UILabel = {
        let label = UILabel()
//        label.text = " 님을 위한 스터디입니다."
        label.textColor = Defaull_style.subTitleColor
        label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let recommendationCollectView : recommendationCollectionView = {
        let collect = recommendationCollectionView()
        collect.backgroundColor = .green
        collect.translatesAutoresizingMaskIntoConstraints = false
        return collect
    }()
    let recommendationUserLocateLabel : UILabel = {
        let label = UILabel()
        label.text = "위치 기반 추천 스터디입니다."
        label.textColor = Defaull_style.subTitleColor
        label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let recommendationUserLocateCollectView : recommendationUserLocateCollectionView = {
        let collect = recommendationUserLocateCollectionView()
        collect.backgroundColor = .green
        collect.translatesAutoresizingMaskIntoConstraints = false
        return collect
    }()
    let categoryRecomenLabel : UILabel = {
        let label = UILabel()
        label.text = "카테고리"
        label.textColor = Defaull_style.subTitleColor
        label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let categoryRecomenBtn : UIButton = {
        let button = UIButton()
        button.setTitle("전체보기", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        button.setTitleColor(Defaull_style.grayTitleColor, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    

    let categoryRecomendCollectView : categoryCollectView = {
        let collect = categoryCollectView()
        collect.backgroundColor = .white
        collect.translatesAutoresizingMaskIntoConstraints = false
        return collect
    }()
}
// 추천콜렉션뷰
class recommendationCollectionView : UIView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // didSelect에서 사용하는 delegate 정의
    var delegate : search_VC_delegate?
    
    var collectionview: UICollectionView!
    var cellId = "Cell2"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // Create an instance of UICollectionViewFlowLayout since you cant
        // Initialize UICollectionView without a layout
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        //        layout.itemSize = CGSize(width: self.frame.width/2, height: self.frame.height)
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.scrollDirection = .horizontal
        
        collectionview = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height), collectionViewLayout: layout)
        //        collectionview.collectionViewLayout = layout
        collectionview.contentInsetAdjustmentBehavior = .always
        
        collectionview.dataSource = self
        collectionview.delegate = self
        collectionview.register(recommendationCollectCell.self, forCellWithReuseIdentifier: cellId)
        //        collectionview.showsVerticalScrollIndicator = false
        collectionview.backgroundColor = UIColor.white
        self.addSubview(collectionview)
        //
        //        NSLayoutConstraint.activate([
        //            collectionview.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
        //            collectionview.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0)
        //            ])
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath as IndexPath)!
        print(cell)
        
        //delegate 로 nav로 뷰 이동.
        delegate?.navMoveDelegate(self, index: indexPath.row)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! recommendationCollectCell
        //        cell.contentView.backgroundColor = .red
        return cell
    }
    
}
class recommendationUserLocateCollectionView : UIView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // didSelect에서 사용하는 delegate 정의
    var delegate : search_VC_delegate?
    
    var collectionview: UICollectionView!
    var cellId = "Cell2"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // Create an instance of UICollectionViewFlowLayout since you cant
        // Initialize UICollectionView without a layout
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        //        layout.itemSize = CGSize(width: self.frame.width/2, height: self.frame.height)
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.scrollDirection = .horizontal
        
        collectionview = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height), collectionViewLayout: layout)
        //        collectionview.collectionViewLayout = layout
        collectionview.contentInsetAdjustmentBehavior = .always
        
        collectionview.dataSource = self
        collectionview.delegate = self
        collectionview.register(recommendationCollectCell.self, forCellWithReuseIdentifier: cellId)
        //        collectionview.showsVerticalScrollIndicator = false
        collectionview.backgroundColor = UIColor.white
        self.addSubview(collectionview)
        //
        //        NSLayoutConstraint.activate([
        //            collectionview.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
        //            collectionview.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0)
        //            ])
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath as IndexPath)!
        print(cell)
        
        //delegate 로 nav로 뷰 이동.
//        delegate?.navMoveDelegate(self, index: indexPath.row)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! recommendationCollectCell
        //        cell.contentView.backgroundColor = .red
        return cell
    }
    
}

class recommendationCollectCell : UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initView(){
        // edge 둥글게
        self.layer.cornerRadius = CGFloat(Defaull_style.insideTableViewCorner)
        self.layer.borderColor = Defaull_style.mainTitleColor.cgColor
        self.layer.borderWidth = 0.5
        

        backgroundColor = .white
        
        addSubview(studyCateLabel)
        addSubview(studyNameLabel)
//        addSubview(detailOnlineOrOfflineLabel)
        addSubview(detailLocationLabel)
        addSubview(detailWeekLabel)
        addSubview(detailMemberLabel)
        
        let eachOtherPadding = CGFloat(5)
        
        NSLayoutConstraint.activate([
            studyCateLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: eachOtherPadding),
            studyCateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            
            studyNameLabel.topAnchor.constraint(equalTo: studyCateLabel.bottomAnchor, constant: eachOtherPadding),
            studyNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            studyNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
//
//            detailOnlineOrOfflineLabel.topAnchor.constraint(equalTo: studyNameLabel.bottomAnchor, constant: eachOtherPadding),
//            detailOnlineOrOfflineLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
//            detailOnlineOrOfflineLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            detailLocationLabel.topAnchor.constraint(equalTo: studyNameLabel.bottomAnchor, constant: eachOtherPadding),
            detailLocationLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            detailLocationLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),

            detailWeekLabel.topAnchor.constraint(equalTo: detailLocationLabel.bottomAnchor, constant: eachOtherPadding),
            detailWeekLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            detailWeekLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),

            detailMemberLabel.topAnchor.constraint(equalTo: detailWeekLabel.bottomAnchor, constant: eachOtherPadding),
            detailMemberLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            detailMemberLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            detailMemberLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -eachOtherPadding)
            ])
    }
    let studyCateLabel : UILabel = {
        let label = UILabel()
        label.text = "카테고리"
        label.textColor = Defaull_style.subTitleColor
        label.font = UIFont.systemFont(ofSize: 12, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let studyNameLabel : UILabel = {
        let label = UILabel()
        label.text = "스터디명"
        label.textColor = Defaull_style.subTitleColor
        label.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
//    let detailOnlineOrOfflineLabel : UILabel = {
//        let label = UILabel()
//        label.text = "온라인/오프라인 스터디"
//        label.textColor = Defaull_style.subTitleColor
//        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
    let detailLocationLabel : UILabel = {
        let label = UILabel()
        label.text = "노량진 오프라인 스터디"
        label.textColor = Defaull_style.subTitleColor
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let detailMemberLabel : UILabel = {
        let label = UILabel()
        label.text = "30명"
        label.textColor = Defaull_style.subTitleColor
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let detailWeekLabel : UILabel = {
        let label = UILabel()
        label.text = "월,수,금"
        label.textColor = Defaull_style.subTitleColor
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()



}

// 카테고리 뷰

class categoryCollectView : UIView, TagListViewDelegate{
    var biggerTagListView = TagListView()
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // hsb random color
    func HSBrandomColor() -> UIColor{
        let saturation : CGFloat =  0.45
        let brigtness : CGFloat = 0.85
        let randomHue = CGFloat.random(in: 0.0..<1.0)
        //        print(UIColor(hue: CGFloat(randomHue), saturation: saturation, brightness: brigtness, alpha: 1))
        return UIColor(hue: CGFloat(randomHue), saturation: saturation, brightness: brigtness, alpha: 1)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
//        backgroundColor = .red
        biggerTagListView.delegate = self
        biggerTagListView.textFont = UIFont.systemFont(ofSize: 20, weight: .heavy)
//        biggerTagListView.cornerRadius = CGFloat(Defaull_style.insideTableViewCorner)
//        biggerTagListView.shadowRadius = 2
//        biggerTagListView.shadowOpacity = 0.4
//        biggerTagListView.shadowColor = UIColor.black
//        biggerTagListView.shadowOffset = CGSize(width: 1, height: 1)
        biggerTagListView.paddingX = 5
        biggerTagListView.paddingY = 5
//        biggerTagListView.tagBackgroundColor = HSBrandomColor()
        biggerTagListView.addTags(["#해시태그","#해시태그","#해시태그해시태그","#해시태그","#해시태그","#해시태그","#해시태그","#해시태그","#해시태그해시태그","#해시태그","#해시태그","#해시태그해시태그"])
//        biggerTagListView.tagBackgroundColor = UIColor.clear
//        for i in biggerTagListView.tagViews{
//            i.textColor = HSBrandomColor()
//        }
        biggerTagListView.textColor = UIColor.white
        for i in biggerTagListView.tagViews{
            i.tagBackgroundColor = HSBrandomColor()
            i.cornerRadius = CGFloat(Defaull_style.insideTableViewCorner)
        }

        biggerTagListView.alignment = .left
        
        biggerTagListView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(biggerTagListView)
        
        NSLayoutConstraint.activate([
            biggerTagListView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            biggerTagListView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            biggerTagListView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            biggerTagListView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
            ])
    }
}
