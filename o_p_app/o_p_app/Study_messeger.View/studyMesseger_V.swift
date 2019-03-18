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

        self.addSubview(titleLabel)
        self.addSubview(tableView)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            titleLabel.heightAnchor.constraint(equalToConstant: CGFloat(Defaull_style.mainTitleHeight)),
            
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0),
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
        return 80
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
        addSubview(avatar)
        addSubview(studyNameLabel)
        addSubview(detailWeekLabel)
        addSubview(detailMemberLabel)
//
        let eachOtherPadding = CGFloat(5)
        
        NSLayoutConstraint.activate([
            avatar.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),
            avatar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            avatar.widthAnchor.constraint(equalToConstant: 60),
            avatar.heightAnchor.constraint(equalToConstant: 60),
            
            studyNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: eachOtherPadding),
//            studyNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            studyNameLabel.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 10),
            
//            detailMemberLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: eachOtherPadding),
            detailMemberLabel.centerYAnchor.constraint(equalTo: studyNameLabel.centerYAnchor, constant: 0),
            detailMemberLabel.leadingAnchor.constraint(equalTo: studyNameLabel.trailingAnchor, constant: 10),
            detailMemberLabel.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: 0),
            
            detailWeekLabel.topAnchor.constraint(equalTo: detailMemberLabel.bottomAnchor, constant: eachOtherPadding),
            detailWeekLabel.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 10),
            detailWeekLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            
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
