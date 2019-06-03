//
//  categoryCollectView.swift
//  o_p_app
//
//  Created by OOPSLA on 02/06/2019.
//  Copyright © 2019 haeun. All rights reserved.
//

import Foundation
import UIKit
import TagListView

// 카테고리 뷰
class categoryCollectView : UIView, TagListViewDelegate{
    var biggerTagListView = TagListView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // hsb random color
    func HSBrandomColor() -> UIColor{
        let saturation : CGFloat =  0.45
        let brigtness : CGFloat = 0.85
        let randomHue = CGFloat.random(in: 0.0..<1.0)
        return UIColor(hue: CGFloat(randomHue), saturation: saturation, brightness: brigtness, alpha: 1)
    }
    
    func initView() {
        //        super.layoutSubviews()
        
        //        backgroundColor = .red
        biggerTagListView.delegate = self
        biggerTagListView.textFont = UIFont.systemFont(ofSize: 16, weight: .bold)
        //        biggerTagListView.cornerRadius = CGFloat(Defaull_style.insideTableViewCorner)
        //        biggerTagListView.shadowRadius = 2
        //        biggerTagListView.shadowOpacity = 0.4
        //        biggerTagListView.shadowColor = UIColor.black
        //        biggerTagListView.shadowOffset = CGSize(width: 1, height: 1)
        biggerTagListView.paddingX = 5
        biggerTagListView.paddingY = 5
        biggerTagListView.addTags(programingLanguage().programingArr)
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
