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
import CenteredCollectionView

class search_V : UIView,UIScrollViewDelegate {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        initView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    // variable to save the last position visited, default to zero
    private var lastContentOffset: CGFloat = 0
    
    func initView(){
        scrollView.delegate = self
        // addsubview
        self.addSubview(scrollView)
        scrollView.addSubview(navView)
        scrollView.addSubview(recommendationLabel)
        scrollView.addSubview(recommendationCollectView)
        scrollView.addSubview(recommendationUserLocateLabel)
        scrollView.addSubview(recommendationUserLocateCollectView)
        scrollView.addSubview(categoryRecomenLabel)
        scrollView.addSubview(categoryRecomenBtn)
        scrollView.addSubview(categoryRecomendCollectView)
        navView.setTitleText(s: "탐 색 하 기")
        let margins = self.safeAreaLayoutGuide
        
        // constraint
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            
            navView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
            navView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            navView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            
            recommendationLabel.topAnchor.constraint(equalTo: navView.bottomAnchor, constant: 0),
            recommendationLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Defaull_style.defaultPadding),
            recommendationLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Defaull_style.defaultPadding),
            
            recommendationCollectView.topAnchor.constraint(equalTo: recommendationLabel.bottomAnchor, constant: 20),
            recommendationCollectView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            recommendationCollectView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            recommendationCollectView.heightAnchor.constraint(equalToConstant: 300),
            
            recommendationUserLocateLabel.topAnchor.constraint(equalTo: recommendationCollectView.bottomAnchor, constant: 40),
            recommendationUserLocateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Defaull_style.defaultPadding),
            recommendationUserLocateLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Defaull_style.defaultPadding),
            
            
            recommendationUserLocateCollectView.topAnchor.constraint(equalTo: recommendationUserLocateLabel.bottomAnchor, constant: 20),
            recommendationUserLocateCollectView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            recommendationUserLocateCollectView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            //            recommendationUserLocateCollectView.heightAnchor.constraint(equalToConstant: 600),
            
            
            categoryRecomenLabel.topAnchor.constraint(equalTo: recommendationUserLocateCollectView.bottomAnchor, constant: 40),
            categoryRecomenLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Defaull_style.defaultPadding),
            categoryRecomenLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Defaull_style.defaultPadding),
            //            categoryRecomenLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0),
            
            categoryRecomenBtn.centerYAnchor.constraint(equalTo: categoryRecomenLabel.centerYAnchor),
            categoryRecomenBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Defaull_style.defaultPadding),
            categoryRecomenBtn.leadingAnchor.constraint(lessThanOrEqualTo: categoryRecomenLabel.trailingAnchor, constant: 0),
            
            
            categoryRecomendCollectView.topAnchor.constraint(equalTo: categoryRecomenLabel.bottomAnchor, constant: 20),
            categoryRecomendCollectView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Defaull_style.defaultPadding),
            categoryRecomendCollectView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Defaull_style.defaultPadding),
            //            categoryRecomendCollectView.heightAnchor.constraint(equalToConstant: 100),
            categoryRecomendCollectView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20)
            ])
        
        //test data
        let testData = search_Model(name: "하은")
        recommendationLabel.text = testData.name + " 님을 위한 스터디입니다."
        
    }
    let scrollView : UIScrollView = {
        let scroll = UIScrollView()
        //        scroll.backgroundColor = .cyan
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    lazy var navView : customNavigationViewWithPlus = {
        let view = customNavigationViewWithPlus()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        label.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
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
        label.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
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
        label.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
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
extension search_V  {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(lastContentOffset - scrollView.contentOffset.y)
        
        var differenceBetween = lastContentOffset - scrollView.contentOffset.y
        
        if differenceBetween > 2 {
            differenceBetween = 2
        }
        if differenceBetween < -2 {
            differenceBetween = -2
        }
        /// move up & down
        print("scroll1")
        // 스크롤 방향
        UIView.animate(withDuration: 0.6, animations: {
            
            self.recommendationLabel.center.y += differenceBetween/4
            self.recommendationUserLocateLabel.center.y += differenceBetween/4
            self.categoryRecomenLabel.center.y += differenceBetween/4
            
        })
        
        // update the new position acquired
        self.lastContentOffset = scrollView.contentOffset.y
    }
}

