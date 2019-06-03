//
//  categoryCV_Cell.swift
//  o_p_app
//
//  Created by OOPSLA on 02/06/2019.
//  Copyright © 2019 haeun. All rights reserved.
//

import Foundation
import UIKit

class categoryCV_Cell : UICollectionViewCell {
    
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
        
        NSLayoutConstraint.activate([
            studyCateLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            studyCateLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            studyCateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            studyCateLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            ])
    }
    
    let studyCateLabel : UILabel = {
        let label = UILabel()
        label.text = "카테고리"
        label.textColor = Defaull_style.subTitleColor
        label.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
}
