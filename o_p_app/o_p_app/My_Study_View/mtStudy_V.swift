//
//  mtStudy_V.swift
//  o_p_app
//
//  Created by OOPSLA on 17/03/2019.
//  Copyright © 2019 haeun. All rights reserved.
//

import Foundation
import UIKit
class myStudy_V : UIView {
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
    let tableView : myStudy_V_TV = {
        let view = myStudy_V_TV()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
}
class myStudy_V_TV : UIView {
    var delegate : myStudy_VC_delegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    func initView(){
        self.addSubview(tableView)
        tableView.register(myStudy_V_TV_C.self, forCellReuseIdentifier: "cell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.tableHeaderView = navView
        navView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 45+24+20)
        navView.setTitleText(s: "내스터디")

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            ])
    }
    lazy var navView : customNavigationViewWithPlus = {
        let view = customNavigationViewWithPlus()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let tableView : UITableView = {
        let table = UITableView()
        table.separatorStyle = .none
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = UITableView.automaticDimension
        table.backgroundColor = .white
        table.translatesAutoresizingMaskIntoConstraints  = false
        return table
    }()
}
extension myStudy_V_TV : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.navMoveDelegate(self)
    }
}
extension myStudy_V_TV : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! myStudy_V_TV_C
        //        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
}

class myStudy_V_TV_C : UITableViewCell {
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
        addSubview(studyNameLabel)
        addSubview(describeLabel)
        
        addSubview(lineView)
        
//        addSubview(detailOnlineOrOfflineLabel)
        addSubview(detailLocationLabel)
        addSubview(detailWeekLabel)
        addSubview(detailMemberLabel)
        
        let eachOtherPadding = CGFloat(5)
        let leadingPadding = CGFloat(20)

        NSLayoutConstraint.activate([
            studyNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            studyNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -leadingPadding),
            studyNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingPadding),
            
            
            describeLabel.topAnchor.constraint(equalTo: studyNameLabel.bottomAnchor, constant: eachOtherPadding),
            describeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingPadding),
            describeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -leadingPadding),
            
            
            lineView.topAnchor.constraint(equalTo: describeLabel.bottomAnchor, constant: 40),
            lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingPadding),
            lineView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -leadingPadding),
            lineView.heightAnchor.constraint(equalToConstant: 1),

//            detailOnlineOrOfflineLabel.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: eachOtherPadding),
//            detailOnlineOrOfflineLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingPadding),
//            detailOnlineOrOfflineLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -leadingPadding),
            
            detailLocationLabel.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: eachOtherPadding),
            detailLocationLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingPadding),
//            detailLocationLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -leadingPadding),
            
            detailWeekLabel.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: eachOtherPadding),
            detailWeekLabel.leadingAnchor.constraint(greaterThanOrEqualTo: detailLocationLabel.trailingAnchor),
//            detailWeekLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingPadding),
            detailWeekLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -leadingPadding),
            
            detailMemberLabel.topAnchor.constraint(equalTo: detailWeekLabel.bottomAnchor, constant: eachOtherPadding),
//            detailMemberLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingPadding),
            detailLocationLabel.leadingAnchor.constraint(greaterThanOrEqualTo: self.leadingAnchor),
            detailMemberLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -leadingPadding),
            
            detailMemberLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            ])
    }
    
    let studyNameLabel : UILabel = {
        let label = UILabel()
        label.text = "스터디명"
        label.textColor = Defaull_style.subTitleColor
        label.font = UIFont.systemFont(ofSize: 24, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let describeLabel : UILabel = {
        let label = UILabel()
        label.text = "스터디 설명이 들어갈 곳 입니다. \n아마도 그렇다."
        label.numberOfLines = 0
        label.textColor = Defaull_style.subTitleColor
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let lineView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Defaull_style.subTitleColor
        return view
    }()
    let detailOnlineOrOfflineLabel : UILabel = {
        let label = UILabel()
        label.text = "온라인/오프라인 스터디"
        label.textColor = Defaull_style.subTitleColor
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
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
