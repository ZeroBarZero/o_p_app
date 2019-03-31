//
//  studyDetail_V.swift
//  o_p_app
//
//  Created by OOPSLA on 20/03/2019.
//  Copyright © 2019 haeun. All rights reserved.
//

import Foundation
import UIKit
class studyDetail_Bottom_V : UIView {
    
    var delegate : studyDetail_VC_Delegate?
    
    @IBInspectable dynamic open var rightString : String? {
        didSet {
            right_update()
        }
    }
    @IBInspectable dynamic open var leftString : String? {
        didSet {
            left_update()
        }
    }
    func right_update(){
        right_Btn.setTitle(rightString, for: .normal)
    }
    func left_update(){
        left_Label.text = leftString
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = .white
        initView()
    }
    func initView() {
        self.addSubview(left_Label)
        self.addSubview(right_Btn)
        
        let middle = CGFloat(Int(self.frame.height/2) - 15)
        let width = CGFloat(Int(self.frame.width - 40))
        NSLayoutConstraint.activate([
            left_Label.topAnchor.constraint(equalTo: self.topAnchor, constant: middle),
            left_Label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            right_Btn.centerYAnchor.constraint(equalTo: left_Label.centerYAnchor, constant: 0),
            right_Btn.heightAnchor.constraint(equalToConstant: 50),
            right_Btn.widthAnchor.constraint(equalToConstant: width/2),
            right_Btn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            ])
    }
    let left_Label : UILabel = {
        let label = UILabel()
        label.text = "25명 / 30명"
        label.textColor = Defaull_style.subTitleColor
        label.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let right_Btn : UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(joinBtnEvent), for: .touchDown)
        button.layer.cornerRadius = CGFloat(Defaull_style.insideTableViewCorner)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = Defaull_style.themeColor
        button.setTitle("가입신청", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    @objc func joinBtnEvent() {
        delegate?.alertDelegate()
    }
}
class studyDetail_V : UIView {
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
    func initView() {
        self.backgroundColor = .white
        
        self.addSubview(titleLabel)
        self.addSubview(descriptionLabel)
        self.addSubview(detailLocationLabel)
        self.addSubview(lineView)
        self.addSubview(descriptionLabel_1)
        self.addSubview(weekInfoTable)
        let eachPadding = CGFloat(10)
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: eachPadding),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: eachPadding),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            
            detailLocationLabel.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: eachPadding),
            detailLocationLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            detailLocationLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            
            
            lineView.topAnchor.constraint(equalTo: detailLocationLabel.bottomAnchor, constant: 20),
            lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            lineView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            lineView.heightAnchor.constraint(equalToConstant: 0.8),
            
            descriptionLabel_1.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 20),
            descriptionLabel_1.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            descriptionLabel_1.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            
            weekInfoTable.topAnchor.constraint(equalTo: descriptionLabel_1.bottomAnchor, constant: 10),
            weekInfoTable.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            weekInfoTable.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            weekInfoTable.heightAnchor.constraint(equalToConstant: 150)
            
            ])
        
    }
    
    let titleLabel : UILabel = {
       let label = UILabel()
        label.text = "코딩 테스트 온라인 스터디"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        label.textColor = Defaull_style.mainTitleColor
        return label
    }()
    let descriptionLabel : UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.text = "코딩 테스트 온라인 스터디 입니다.\n스터디장이 매주 토요일 문제를 내고 스터디원들과 함께 풀고 풀이를 공유합니다. :)"
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let detailLocationLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.text = "온라인 스터디"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let lineView : UIView = {
        let view = UIView()
        view.backgroundColor = Defaull_style.whiteGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let descriptionLabel_1 : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
        label.text = "정보"
        label.textColor = Defaull_style.mainTitleColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let weekInfoTable : studyDetail_V_Table = {
        let table = studyDetail_V_Table()
        table.backgroundColor = .red
        table.translatesAutoresizingMaskIntoConstraints  = false
        return table
    }()
}
class studyDetail_V_Table : UIView {
    
    // FIXIT : 테이블 뷰 셀에 추가할 배열
    var tableCellArr = ["알림 설정","백업"]
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
    func initView() {
        self.addSubview(table)
        table.delegate = self
        table.dataSource = self
        table.register(studyDetail_V_Table_Cell.self, forCellReuseIdentifier: "cell")
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            table.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            table.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            table.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            ])
    }
    let table : UITableView = {
        let table = UITableView()
        table.separatorStyle = .none
        table.backgroundColor = Defaull_style.topTableView
        table.translatesAutoresizingMaskIntoConstraints  = false
        return table
    }()
    
}

extension studyDetail_V_Table : UITableViewDelegate {
    
}
extension studyDetail_V_Table : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! studyDetail_V_Table_Cell
        
        return cell
    }
    
    
}

class studyDetail_V_Table_Cell : UITableViewCell {
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    override func layoutSubviews() {
        super.layoutSubviews()
        initView()
    }
    func initView() {
        addSubview(weekTitleLabel)
        addSubview(timeLabel)
        
        NSLayoutConstraint.activate([
            weekTitleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),
            weekTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            
            timeLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),
            timeLabel.leadingAnchor.constraint(equalTo: weekTitleLabel.trailingAnchor, constant: 40),
            ])
    }
    let weekTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "월"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        label.textColor = Defaull_style.mainTitleColor
        return label
    }()
    
    let timeLabel : UILabel = {
        let label = UILabel()
        label.text = "11 : 00 ~ 13:00 (2시간)"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.textColor = Defaull_style.mainTitleColor
        return label
    }()


}
