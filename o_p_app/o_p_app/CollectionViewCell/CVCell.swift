//
//  dayCVCell.swift
//  o_p_app
//
//  Created by OOPSLA on 05/05/2019.
//  Copyright © 2019 haeun. All rights reserved.
//

import Foundation
import UIKit

class daySelectCVCell : UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func initView(){
        addSubview(dayLabel)
        
        NSLayoutConstraint.activate([
            dayLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            dayLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            dayLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            dayLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            ])
        
    }
    
    lazy var dayLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    func dayDirectText(index : Int) {
        switch index {
        case 0:
            dayLabel.text = "월"
        case 1:
            dayLabel.text = "화"
        case 2:
            dayLabel.text = "수"
        case 3:
            dayLabel.text = "목"
        case 4:
            dayLabel.text = "금"
        case 5:
            dayLabel.text = "토"
        case 6:
            dayLabel.text = "일"
        default:
            dayLabel.text = "월"
        }
    }
}
