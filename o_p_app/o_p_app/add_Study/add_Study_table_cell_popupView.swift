//
//  add_Study_table_cell_popupView.swift
//  o_p_app
//
//  Created by OOPSLA on 01/04/2019.
//  Copyright © 2019 haeun. All rights reserved.
//

import Foundation
import UIKit

protocol dismissPopView {
    func dismissPopView()
}
// 서버로 보낼 데이터 Model
class studyInfo {
    let title : String
    let description : String
    let studyWeekInfo : String
    let maxMember : Int
    let place : String
    
    init(title:String,
         description :String,
         studyWeekInfo : String,
         maxMember : Int,
         place : String) {
        self.title = title
        self.description = description
        self.studyWeekInfo = studyWeekInfo
        self.maxMember = maxMember
        self.place = place
    }
}
class add_Study_table_cell_popupView : UIViewController, dismissPopView {
    func dismissPopView() {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = #colorLiteral(red: 0.55609764, green: 0.55609764, blue: 0.55609764, alpha: 0.798828125)
        self.view.addSubview(mainView)
        NSLayoutConstraint.activate([
            mainView.heightAnchor.constraint(equalToConstant: self.view.frame.height / 2),
            mainView.widthAnchor.constraint(equalToConstant: self.view.frame.width - 40),
            mainView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
            mainView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0),
        ])
        mainView.delegate = self
    }
    
    let mainView : popupView_View = {
        let view = popupView_View()
        view.layer.cornerRadius = CGFloat(Defaull_style.topTableViewCorner)
        view.layer.masksToBounds = true
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
}

class popupView_View : UIView {
    var delegate : dismissPopView?
    var startStackBoolUseBtn : Bool = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        startBtn.setTitleColor(Defaull_style.themeColor, for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.addSubview(weekLabel)
        self.addSubview(stackView)
        // inside stack
        startStack.addArrangedSubview(startBtn)
        startStack.addArrangedSubview(startTimeLabel)
        endStack.addArrangedSubview(endBtn)
        endStack.addArrangedSubview(endTimeLabel)
        
        stackView.addArrangedSubview(startStack)
        stackView.addArrangedSubview(endStack)
        
        self.addSubview(timePickerStart)
        self.addSubview(btnStack)
        
        btnStack.addArrangedSubview(first_to_next_Btn)

//        self.addSubview(enter_Btn)
//
        NSLayoutConstraint.activate([
            weekLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
//            weekLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),
            weekLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
//
            stackView.topAnchor.constraint(equalTo: weekLabel.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            
            timePickerStart.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 0),
            timePickerStart.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            timePickerStart.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
//            timePickerStart.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
            btnStack.heightAnchor.constraint(equalToConstant: 50),
            btnStack.topAnchor.constraint(equalTo: timePickerStart.bottomAnchor, constant: 0),
            btnStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            btnStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            btnStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            ])
        enter_Btn.addTarget(self, action: #selector(dismissPopViewDelegate), for: .touchDown)
    }
    @objc func dismissPopViewDelegate(){
        delegate?.dismissPopView()
    }
    let weekLabel : UILabel = {
        let label = UILabel()
        label.text = "월"
        label.textColor = Defaull_style.mainTitleColor
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let stackView : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 2
        return stack
    }()
    let startStack : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .center
        return stack
    }()
    let startBtn : UIButton = {
        let button = UIButton()
        button.setTitleColor(Defaull_style.mainTitleColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        button.setTitle("시작 시간", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let startTimeLabel : UILabel = {
        let label = UILabel()
        label.text = "10:00 PM"
        label.textColor = Defaull_style.mainTitleColor
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let timePickerStart : UIDatePicker = {
        let picker = UIDatePicker()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.datePickerMode = .time
//        picker.isHidden = true
        return picker
    }()
    let endStack : UIStackView = {
        let stack = UIStackView()
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        return stack
    }()
    let endBtn : UIButton = {
        let button = UIButton()
        button.setTitleColor(Defaull_style.mainTitleColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        button.setTitle("끝나는 시간", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let endTimeLabel : UILabel = {
        let label = UILabel()
        label.text = "10:00 PM"
        label.textColor = Defaull_style.mainTitleColor
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let btnStack : UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillEqually
//        stack.spacing = 2
        return stack
    }()

    let enter_Btn : UIButton = {
        let button = UIButton()
        //        button.addTarget(self, action: #selector(joinBtnEvent), for: .touchDown)
        button.layer.cornerRadius = CGFloat(Defaull_style.insideTableViewCorner)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = Defaull_style.themeColor
        button.setTitle("확인", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let first_to_next_Btn : UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(first_to_next_action), for: .touchDown)
        button.layer.cornerRadius = CGFloat(Defaull_style.insideTableViewCorner)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = Defaull_style.themeColor
        button.setTitle("다음", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let before_Btn : UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(back_action), for: .touchDown)
        button.layer.cornerRadius = CGFloat(Defaull_style.insideTableViewCorner)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = Defaull_style.themeColor
        button.setTitle("이전", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    // 다음 버튼 이벤트
    @objc func first_to_next_action(){
//        btnStack.removeArrangedSubview(first_to_next_Btn)
        if startStackBoolUseBtn {
            first_to_next_Btn.removeFromSuperview()
            btnStack.addArrangedSubview(before_Btn)
            btnStack.addArrangedSubview(first_to_next_Btn)
            // TEXT COLOR CHANGE
            startBtn.setTitleColor(Defaull_style.mainTitleColor, for: .normal)
            endBtn.setTitleColor(Defaull_style.themeColor, for: .normal)
            startStackBoolUseBtn = false
        }else{
            delegate?.dismissPopView()
        }
    }
    @objc func back_action(){
        before_Btn.removeFromSuperview()
        first_to_next_Btn.removeFromSuperview()
        
        btnStack.addArrangedSubview(first_to_next_Btn)
        startBtn.setTitleColor(Defaull_style.themeColor, for: .normal)
        endBtn.setTitleColor(Defaull_style.mainTitleColor, for: .normal)
        startStackBoolUseBtn = true
    }
}
