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

//        self.addSubview(titleLabel)
        self.addSubview(tableView)

        NSLayoutConstraint.activate([
//            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
//            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
//            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
//            titleLabel.heightAnchor.constraint(equalToConstant: CGFloat(Defaull_style.mainTitleHeight)),
            
            tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
            ])
    }
    let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "  내스터디"
        label.textAlignment = .left
        label.textColor = Defaull_style.mainTitleColor
        label.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
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
        tableView.register(myStudy_V_TV_C.self, forCellReuseIdentifier: "cell")

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
extension myStudy_V_TV : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
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
    addSubview(detailOnlineOrOfflineLabel)
    addSubview(detailLocationLabel)
    addSubview(detailWeekLabel)
    addSubview(detailMemberLabel)
    
    let eachOtherPadding = CGFloat(5)
    
    NSLayoutConstraint.activate([
    studyNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: eachOtherPadding),
    studyNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
    studyNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
    
    detailOnlineOrOfflineLabel.topAnchor.constraint(equalTo: studyNameLabel.bottomAnchor, constant: eachOtherPadding),
    detailOnlineOrOfflineLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
    detailOnlineOrOfflineLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
    
    detailLocationLabel.topAnchor.constraint(equalTo: detailOnlineOrOfflineLabel.bottomAnchor, constant: eachOtherPadding),
    detailLocationLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
    detailLocationLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
    
    detailWeekLabel.topAnchor.constraint(equalTo: detailLocationLabel.bottomAnchor, constant: eachOtherPadding),
    detailWeekLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
    detailWeekLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
    
    detailMemberLabel.topAnchor.constraint(equalTo: detailWeekLabel.bottomAnchor, constant: eachOtherPadding),
    detailMemberLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
    detailMemberLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
    
    ])
}

    let studyNameLabel : UILabel = {
        let label = UILabel()
        label.text = "스터디명"
        label.textColor = Defaull_style.subTitleColor
        label.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        label.text = "노량진"
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
