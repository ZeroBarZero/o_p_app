//
//  myinfo_V.swift
//  o_p_app
//
//  Created by OOPSLA on 17/03/2019.
//  Copyright © 2019 haeun. All rights reserved.
//

import Foundation
import UIKit

class myinfo_V : UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = .white

        self.addSubview(avatar)
        self.addSubview(nameTitle)
        self.addSubview(myDescriptionLabel)
        
        self.addSubview(lineView)

        self.addSubview(joinDescribteLabel)
        
        self.addSubview(categoryRecomenLabel)
        self.addSubview(categoryRecomenBtn)
        self.addSubview(categoryRecomendCollectView)
        
        let margins = CGFloat(Defaull_style.defaultPadding)
        
        NSLayoutConstraint.activate([
            avatar.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            avatar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 35),
            avatar.widthAnchor.constraint(equalToConstant: 75),
            avatar.heightAnchor.constraint(equalToConstant: 75),
            
            nameTitle.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 20),
            nameTitle.bottomAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 0),
            nameTitle.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -35),
            
            myDescriptionLabel.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 35),
            myDescriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            myDescriptionLabel.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -20),
            
            lineView.topAnchor.constraint(equalTo: myDescriptionLabel.bottomAnchor, constant: 35),
            lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            lineView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            lineView.heightAnchor.constraint(equalToConstant: 0.8),

            joinDescribteLabel.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 35),
            joinDescribteLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            joinDescribteLabel.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -20),
            
            categoryRecomenLabel.topAnchor.constraint(equalTo: joinDescribteLabel.bottomAnchor, constant: 10),
            categoryRecomenLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margins),
            categoryRecomenLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -margins),
            
            categoryRecomenBtn.centerYAnchor.constraint(equalTo: categoryRecomenLabel.centerYAnchor),
            categoryRecomenBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -margins),
            categoryRecomenBtn.leadingAnchor.constraint(lessThanOrEqualTo: categoryRecomenLabel.trailingAnchor, constant: 0),
            
            categoryRecomendCollectView.topAnchor.constraint(equalTo: categoryRecomenLabel.bottomAnchor, constant: 20),
//            categoryRecomendCollectView.widthAnchor.constraint(equalTo: widthAnchor),
            categoryRecomendCollectView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margins),
            categoryRecomendCollectView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -margins),
            categoryRecomendCollectView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
//            categoryRecomendCollectView.heightAnchor.constraint(equalToConstant: 200),

            ])
    }
    let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "  내정보"
        label.textAlignment = .left
        label.textColor = Defaull_style.mainTitleColor
        label.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var avatar: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "avatar.jpg"))
//        imageView.autoSetDimensions(to: CGSize(width: 128.0, height: 128.0))
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true  // 이미지 radius대로 자름
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let nameTitle : UILabel = {
        let label = UILabel()
        label.text = "이하은"
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Defaull_style.mainTitleColor
        return label
    }()
    let myDescriptionLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "멋진 개발자가 되고 싶어요! :>\n현재는 iOS 개발을 하고 있습니다 !"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Defaull_style.mainTitleColor
        return label
    }()

    let lineView : UIView = {
        let view = UIView()
        view.backgroundColor = Defaull_style.whiteGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let joinStackView : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .center
//        stack.spacing = 2
        return stack
    }()
    let viewInsideStack : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let joinDescribteLabel : UILabel = {
        let label = UILabel()
        label.text = "3 개의 가입한 스터디"
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Defaull_style.subTitleColor
        return label
    }()
    let joinLabel : UILabel = {
        let label  = UILabel()
        label.text = "100"
        label.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Defaull_style.mainTitleColor
        return label
    }()
    let categoryRecomenLabel : UILabel = {
        let label = UILabel()
        label.text = "3 개의 관심 카테고리"
        label.textColor = Defaull_style.subTitleColor
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
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
