//
//  studyMesseger_V.swift
//  o_p_app
//
//  Created by OOPSLA on 17/03/2019.
//  Copyright © 2019 haeun. All rights reserved.
//

import Foundation
import UIKit

class studyMesseger_V : UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = .white

        self.addSubview(tableView)
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
            ])
    }
    let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "  내메신저"
        label.textAlignment = .left
        label.textColor = Defaull_style.mainTitleColor
        label.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let tableView : studyMesseger_V_TV = {
        let view = studyMesseger_V_TV()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
}
class studyMesseger_V_TV : UIView {
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
    func initView(){
        self.addSubview(tableView)
        tableView.register(studyMesseger_V_TV_C.self, forCellReuseIdentifier: "cell")
        
        tableView.delegate = self
        tableView.dataSource = self
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            ])
    }
    let tableView : UITableView = {
        let table = UITableView()
        //        table.separatorStyle = .none
        table.backgroundColor = Defaull_style.topTableView
        table.translatesAutoresizingMaskIntoConstraints  = false
        return table
    }()
}
extension studyMesseger_V_TV : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
extension studyMesseger_V_TV : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! studyMesseger_V_TV_C
        //        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
}

class studyMesseger_V_TV_C : UITableViewCell {
    override func layoutSubviews() {
        super.layoutSubviews()
        //        initView()
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func initView(){
//        addSubview(avatar)
        addSubview(studyNameLabel)
        addSubview(lastMessageTimeLabel)
        addSubview(lastMessageLabel)
//
//        let eachOtherPadding = CGFloat(5)
        
        NSLayoutConstraint.activate([
//            avatar.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),
//            avatar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Defaull_style.defaultPadding),
//            avatar.widthAnchor.constraint(equalToConstant: 60),
//            avatar.heightAnchor.constraint(equalToConstant: 60),
            
            studyNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Defaull_style.defaultPadding),
//            studyNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            studyNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Defaull_style.defaultPadding),
            
//            detailMemberLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: eachOtherPadding),
            lastMessageTimeLabel.centerYAnchor.constraint(equalTo: studyNameLabel.centerYAnchor, constant: 0),
            lastMessageTimeLabel.leadingAnchor.constraint(lessThanOrEqualTo: studyNameLabel.trailingAnchor, constant: 10),
            lastMessageTimeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Defaull_style.defaultPadding),
            
            lastMessageLabel.topAnchor.constraint(equalTo: lastMessageTimeLabel.bottomAnchor, constant: 3),
            lastMessageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor
                , constant: Defaull_style.defaultPadding),
            lastMessageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Defaull_style.defaultPadding),
            lastMessageLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Defaull_style.defaultPadding),
            
            ])
    }
    let avatar: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "avatar.jpg"))
//        imageView.autoSetDimensions(to: CGSize(width: 128.0, height: 128.0))
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.layer.cornerRadius = 20
        imageView.backgroundColor = .red
        imageView.clipsToBounds = true  // 이미지 radius대로 자름
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let studyNameLabel : UILabel = {
        let label = UILabel()
        label.text = "스터디명"
        label.textColor = Defaull_style.subTitleColor
        label.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let lastMessageTimeLabel : UILabel = {
        let label = UILabel()
        label.text = "오전 11:00"
        label.textColor = Defaull_style.subTitleColor
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let lastMessageLabel : UILabel = {
        let label = UILabel()
        label.text = "마지막 메세지가 나올 것 입니다. 마지막 메세지가 나올 것 입니다. 마지막 메세지가 나올 것 입니다. 마지막 메세지가 나올 것 입니다."
        label.numberOfLines = 2
        label.textColor = Defaull_style.grayTitleColor
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
}
