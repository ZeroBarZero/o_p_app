//
//  studyDetail_V.swift
//  o_p_app
//
//  Created by OOPSLA on 20/03/2019.
//  Copyright © 2019 haeun. All rights reserved.
//

import Foundation
import UIKit
class studyDetail_Bottom_V : UIView {
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
    func initView() {
        self.addSubview(memberRimitLabel)
        self.addSubview(joinBtn)
        
        let middle = CGFloat(Int(self.frame.height/2) - 15)
        let width = CGFloat(Int(self.frame.width - 40))
        NSLayoutConstraint.activate([
            memberRimitLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: middle),
            memberRimitLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            joinBtn.centerYAnchor.constraint(equalTo: memberRimitLabel.centerYAnchor, constant: 0),
            joinBtn.heightAnchor.constraint(equalToConstant: 50),
            joinBtn.widthAnchor.constraint(equalToConstant: width/2),
            joinBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            ])
    }
    let memberRimitLabel : UILabel = {
        let label = UILabel()
        label.text = "25명 / 30명"
        label.textColor = Defaull_style.subTitleColor
        label.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let joinBtn : UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = CGFloat(Defaull_style.insideTableViewCorner)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = Defaull_style.themeColor
        button.setTitle("가입신청", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
}
class studyDetail_V : UIView {
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
        self.backgroundColor = .white
        
        self.addSubview(titleLabel)
        self.addSubview(descriptionLabel)
        self.addSubview(detailLocationLabel)
        let eachPadding = CGFloat(10)
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: eachPadding),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: eachPadding),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            
            detailLocationLabel.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: eachPadding),
            detailLocationLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            detailLocationLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            ])
    }
    
    let titleLabel : UILabel = {
       let label = UILabel()
        label.text = "스터디명스터디명스터디명입니다."
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        label.textColor = Defaull_style.mainTitleColor
        return label
    }()
    let descriptionLabel : UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.text = "세상에나마상에나세상에나마상에나세상에나마상에나세상에나마상에나세상에나마상에나세상에나마상에나세상에나마상에나세상에나마상에나세상에나마상에나세상에나마상에나세상에나마상에나세상에나마상에나세상에나마상에나세상에나마상에나세상에나마상에나"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let detailLocationLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.text = "서울, 노량진 온라인 스터디"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
}
