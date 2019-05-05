//
//  TVCell.swift
//  o_p_app
//
//  Created by OOPSLA on 05/05/2019.
//  Copyright © 2019 haeun. All rights reserved.
//

import Foundation
import UIKit

class dayBaseTimeSelectTVCell : UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func initView(){
        self.addSubview(weekLabel)
        self.addSubview(weekLabelView)
        weekLabelView.addSubview(detailLocationLabel)
        
        let margin = CGFloat(Defaull_style.insideMargin)
        
        NSLayoutConstraint.activate([
            weekLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),
            weekLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margin),
            
            weekLabelView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),
            weekLabelView.leadingAnchor.constraint(equalTo: weekLabel.trailingAnchor, constant: 0),
            weekLabelView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            
            detailLocationLabel.centerYAnchor.constraint(equalTo: weekLabelView.centerYAnchor, constant: 0),
            detailLocationLabel.centerXAnchor.constraint(equalTo: weekLabelView.centerXAnchor, constant: 0),
            
            ])
    }
    let weekLabelView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let weekLabel : UILabel = {
        let label = UILabel()
        label.textColor = Defaull_style.mainTitleColor
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let detailLocationLabel : UILabel = {
        let label = UILabel()
        label.textColor = Defaull_style.whiteGray
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.text = "시간 선택"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
}

