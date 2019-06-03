//
//  recommendationUserLocateCV_Cell.swift
//  o_p_app
//
//  Created by OOPSLA on 02/06/2019.
//  Copyright © 2019 haeun. All rights reserved.
//

import Foundation
import UIKit

class recommendationUserLocateCV_Cell : UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        initView()
    }
    func initView() {
        addSubview(imageVieww)
        addSubview(stackView)
        stackView.addArrangedSubview(studyCateLabel)
        stackView.addArrangedSubview(studyNameLabel)
        //        addSubview(detailOnlineOrOfflineLabel)
        stackView.addArrangedSubview(detailLocationLabel)
        stackView.addArrangedSubview(detailWeekLabel)
        stackView.addArrangedSubview(detailMemberLabel)
        
        let eachOtherPadding = CGFloat(5)
        
        NSLayoutConstraint.activate([
            imageVieww.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            imageVieww.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            imageVieww.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            
            stackView.topAnchor.constraint(equalTo: imageVieww.bottomAnchor, constant: eachOtherPadding),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -eachOtherPadding),
            ])
    }
    let imageVieww : UIImageView = {
        let imagee = UIImageView()
//        imagee.frame.size = CGSize(width: 0, height: 150)
        imagee.translatesAutoresizingMaskIntoConstraints = false
        imagee.image = UIImage(named: "javascript_512x512")
        imagee.contentMode = UIImageView.ContentMode.scaleAspectFit
        return imagee
    }()
    
    let stackView : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 4
        return stack
    }()
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
