//
//  add_Study_selectPeople_popVIew.swift
//  o_p_app
//
//  Created by OOPSLA on 12/04/2019.
//  Copyright © 2019 haeun. All rights reserved.
//

import Foundation
import UIKit

class add_Study_selectPeople_popVIew : UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var delegate : add_study2_VC_Delegate?
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(row+1) + " 명"
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectMemberLabel.text = String(row + 1) + " 명"
        enter_Btn.isEnabled = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        view.backgroundColor = #colorLiteral(red: 0.55609764, green: 0.55609764, blue: 0.55609764, alpha: 0.798828125)
        
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.delegate = self
        self.view.addSubview(mainView)
        mainView.addSubview(peopleLabel)
        mainView.addSubview(selectMemberLabel)
        mainView.addSubview(picker)
        mainView.addSubview(enter_Btn)
        
        NSLayoutConstraint.activate([
//            mainView.heightAnchor.constraint(equalToConstant: self.view.frame.height / 2),
            mainView.widthAnchor.constraint(equalToConstant: self.view.frame.width - 40),
            mainView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
            mainView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0),
            
            peopleLabel.centerXAnchor.constraint(equalTo: mainView.centerXAnchor, constant: 0),
            peopleLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 20),
            
            selectMemberLabel.topAnchor.constraint(equalTo: peopleLabel.bottomAnchor, constant: 10),
            selectMemberLabel.centerXAnchor.constraint(equalTo: mainView.centerXAnchor, constant: 0),
            
            picker.topAnchor.constraint(equalTo: selectMemberLabel.bottomAnchor, constant: 0),
            picker.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 0),
            picker.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: 0),
//            picker.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: 0),
            
            enter_Btn.topAnchor.constraint(equalTo: picker.bottomAnchor, constant: 0),
            enter_Btn.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 0),
            enter_Btn.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: 0),
            enter_Btn.heightAnchor.constraint(equalToConstant: 40),
            enter_Btn.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: 0),
            ])
        enter_Btn.addTarget(nil, action: #selector(enterBtnEvent), for: .touchDown)
    }
    @objc func enterBtnEvent(){
        delegate?.step2_memberSelectView_passingMemberValue(s: selectMemberLabel.text!)
        dismiss(animated: true, completion: nil)
    }
    let mainView : UIView = {
        let view = UIView()
        view.layer.cornerRadius = CGFloat(Defaull_style.topTableViewCorner)
        view.layer.masksToBounds = true
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let peopleLabel : UILabel = {
        let label = UILabel()
        label.text = "스터디 인원"
        label.textColor = Defaull_style.mainTitleColor
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let selectMemberLabel : UILabel = {
        let label = UILabel()
        label.text = " "
        label.textColor = Defaull_style.mainTitleColor
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let enter_Btn : UIButton = {
        let button = UIButton()
        //        button.addTarget(self, action: #selector(joinBtnEvent), for: .touchDown)
        //        button.layer.cornerRadius = CGFloat(Defaull_style.insideTableViewCorner)
        button.isEnabled = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = Defaull_style.themeColor
        button.setTitle("확인", for: .normal)
        button.setTitle("인원을 선택해주세요.", for: .disabled)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

}
