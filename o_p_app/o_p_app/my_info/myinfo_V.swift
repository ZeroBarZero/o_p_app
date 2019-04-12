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
        self.addSubview(lineView)
        
        viewInsideStack.addSubview(joinDescribteLabel)
        viewInsideStack.addSubview(joinLabel)
        joinStackView.addArrangedSubview(viewInsideStack)
        self.addSubview(joinStackView)
        
        self.addSubview(categoryRecomenLabel)
        self.addSubview(categoryRecomenBtn)
        self.addSubview(categoryRecomendCollectView)
        
        let margins = CGFloat(Defaull_style.defaultPadding)
        
        NSLayoutConstraint.activate([
            avatar.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
            avatar.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            avatar.widthAnchor.constraint(equalToConstant: 128),
            avatar.heightAnchor.constraint(equalToConstant: 128),
            
            nameTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
            nameTitle.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: CGFloat(Defaull_style.insideMargin)),
            
            lineView.topAnchor.constraint(equalTo: nameTitle.bottomAnchor, constant: 20),
            lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            lineView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            lineView.heightAnchor.constraint(equalToConstant: 0.8),

            joinStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margins),
            joinStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -margins),
            joinStackView.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: CGFloat(Defaull_style.insideMargin)),
//            joinStackView.heightAnchor.constraint(equalToConstant: self.frame.height/8),
            
            joinDescribteLabel.centerXAnchor.constraint(equalTo: joinStackView.centerXAnchor, constant: 0),
            joinDescribteLabel.topAnchor.constraint(equalTo: joinStackView.topAnchor, constant: CGFloat(Defaull_style.insideMargin)),
            
            joinLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
            joinLabel.topAnchor.constraint(equalTo: joinDescribteLabel.bottomAnchor, constant: CGFloat(Defaull_style.insideMargin)),
            
            joinStackView.bottomAnchor.constraint(equalTo: joinLabel.bottomAnchor, constant: 0),
            // set stack
            
            
            categoryRecomenLabel.topAnchor.constraint(equalTo: joinStackView.bottomAnchor, constant: 10),
            categoryRecomenLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margins),
            categoryRecomenLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -margins),
            
            categoryRecomenBtn.centerYAnchor.constraint(equalTo: categoryRecomenLabel.centerYAnchor),
            categoryRecomenBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -margins),
            categoryRecomenBtn.leadingAnchor.constraint(lessThanOrEqualTo: categoryRecomenLabel.trailingAnchor, constant: 0),
            
            categoryRecomendCollectView.topAnchor.constraint(equalTo: categoryRecomenLabel.bottomAnchor, constant: 10),
//            categoryRecomendCollectView.widthAnchor.constraint(equalTo: widthAnchor),
            categoryRecomendCollectView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margins),
            categoryRecomendCollectView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -margins),
            categoryRecomendCollectView.heightAnchor.constraint(equalToConstant: 200),

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
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.layer.cornerRadius = 64.0
        imageView.clipsToBounds = true  // 이미지 radius대로 자름
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let nameTitle : UILabel = {
        let label = UILabel()
        label.text = "이하은"
        label.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
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
        label.text = "가입한 스터디"
        label.font = UIFont.systemFont(ofSize: 14, weight: .heavy)
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
