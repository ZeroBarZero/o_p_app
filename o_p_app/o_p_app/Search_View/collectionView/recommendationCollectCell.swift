//
//  recommendationCollectCell.swift
//  o_p_app
//
//  Created by OOPSLA on 02/06/2019.
//  Copyright © 2019 haeun. All rights reserved.
//

import Foundation
import UIKit

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
        //        self.layer.cornerRadius = CGFloat(Defaull_style.insideTableViewCorner)
//        self.layer.borderColor = Defaull_style.mainTitleColor.cgColor
//        self.layer.borderWidth = 0.5
        mainView.addShadow(offset: CGSize.init(width: 3, height: 3), color: UIColor.gray, radius: 10, opacity: 0.2)

        
        mainView.backgroundColor = .white
        
        addSubview(mainView)
        
        mainView.addSubview(imageVieww)
        mainView.addSubview(stackView)
        
        stackView.addArrangedSubview(studyCateLabel)
        stackView.addArrangedSubview(studyNameLabel)
        stackView.addArrangedSubview(detailLocationLabel)
        stackView.addArrangedSubview(detailWeekLabel)
        stackView.addArrangedSubview(detailMemberLabel)
        
        let eachOtherPadding = CGFloat(30)
        
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            mainView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            mainView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            mainView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            imageVieww.topAnchor.constraint(equalTo: mainView.topAnchor, constant: eachOtherPadding),
            imageVieww.centerXAnchor.constraint(equalTo: mainView.centerXAnchor, constant: 0),

            stackView.topAnchor.constraint(equalTo: imageVieww.bottomAnchor, constant: eachOtherPadding),
            stackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10),
            stackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -5),
            ])
    }
    lazy var mainView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let stackView : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 2
        return stack
    }()
    let imageVieww : UIImageView = {
        let imagee = UIImageView()
        imagee.translatesAutoresizingMaskIntoConstraints = false
        imagee.image = UIImage(named: "swift_512x512")
        imagee.contentMode = UIImageView.ContentMode.scaleAspectFit
        return imagee
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

extension UIView {
    
    func addShadow(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float) {
        layer.masksToBounds = false
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        
        let backgroundCGColor = backgroundColor?.cgColor
        backgroundColor = nil
        layer.backgroundColor =  backgroundCGColor
    }
}
