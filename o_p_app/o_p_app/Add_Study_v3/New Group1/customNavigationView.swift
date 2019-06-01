//
//  customNavigationView.swift
//  o_p_app
//
//  Created by OOPSLA on 19/05/2019.
//  Copyright © 2019 haeun. All rights reserved.
//

import Foundation
import UIKit

class customNavigationView : UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initView(){
        self.addSubview(editBtn)
        self.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            editBtn.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            editBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            editBtn.widthAnchor.constraint(equalToConstant: 60),
            editBtn.heightAnchor.constraint(equalToConstant: 22),

            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 45),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20)
            ])
    }
    func setTitleText(s:String){
        titleLabel.text = s
    }
    lazy var editBtn : UIButton = {
        let button = UIButton()
        button.setTitleColor(Defaull_style.gray112Color, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        button.setTitle("수정", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = Defaull_style.mainTitleColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}
class customNavigationViewWithBack : UIView {
    var delegate : add_study2_VC_Delegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func initView(){
        
        self.addSubview(titleLabel)
        self.addSubview(backBtn)
        
        NSLayoutConstraint.activate([
            backBtn.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            backBtn.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            backBtn.widthAnchor.constraint(equalToConstant: 30),
            backBtn.heightAnchor.constraint(equalToConstant: 30),
            
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 45),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20)
            ])
    }
    func setTitleText(s:String){
        titleLabel.text = s
    }
    let backBtn : UIButton = {
        let button = UIButton()
//        button.backgroundColor =  .red
        button.setImage(UIImage(named: "btnBack"), for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        button.imageView?.contentMode = UIImageView.ContentMode.scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = Defaull_style.mainTitleColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}
class customNavigationViewWithPlus : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func initView(){
        
        self.addSubview(titleLabel)
        self.addSubview(plusBtn)
        
        NSLayoutConstraint.activate([
            plusBtn.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            plusBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            plusBtn.widthAnchor.constraint(equalToConstant: 30),
            plusBtn.heightAnchor.constraint(equalToConstant: 30),
            
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 45),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20)
            ])
    }
    func setTitleText(s:String){
        titleLabel.text = s
    }
    let plusBtn : UIButton = {
        let button = UIButton()
        //        button.backgroundColor =  .red
        button.setImage(UIImage(named: "icFilterPlus"), for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        button.imageView?.contentMode = UIImageView.ContentMode.scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = Defaull_style.mainTitleColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}
