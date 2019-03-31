//
//  login_VC.swift
//  o_p_app
//
//  Created by OOPSLA on 31/03/2019.
//  Copyright © 2019 haeun. All rights reserved.
//

import Foundation
import UIKit
import TextFieldEffects
import AnimatedTextInput
import IQKeyboardManagerSwift


class login_VC : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        IQKeyboardManager.shared.enable = true

        view.backgroundColor = .white
        
        view.addSubview(ID_textField)
        view.addSubview(Pass_textField)
        view.addSubview(enter_Btn)
        enter_Btn.addTarget(self, action: #selector(moveView), for: .touchDown)
        
        let margin = CGFloat(20)
        
        NSLayoutConstraint.activate([
            ID_textField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            ID_textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin),
            ID_textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin),
            
            
            Pass_textField.topAnchor.constraint(equalTo: ID_textField.bottomAnchor, constant: 0),
            Pass_textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin),
            Pass_textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin),

            
            enter_Btn.topAnchor.constraint(equalTo: Pass_textField.bottomAnchor, constant: 10),
            enter_Btn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            enter_Btn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
//            enter_Btn.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            enter_Btn.heightAnchor.constraint(equalToConstant: 50)
            ])
        
        
    }
    @objc func moveView() {
        self.navigationController?.pushViewController(ViewController(), animated: true)
    }
    
    @objc func enterBtn(){
        let id = ID_textField.text
        let pass = Pass_textField.text
        
        print(id ?? "")
        print(pass ?? "")
        
        let url = "http://www.localhost:3333/user/login"
        
        let url1 = URL(string: url)!
        URLSession.shared.dataTask(with: url1, completionHandler: {
            (data, response, error) in
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options:.allowFragments) as! [String : AnyObject]
                
                let state = json["status"]
                if state! as! String == "OK" {
                }else{
                    print("실패")
                }
            }catch let error as NSError{
                print("error:\(error)")
//                dispatchGroup.leave()
            }
        }).resume()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    let ID_textField : AnimatedTextInput = {
        let text = AnimatedTextInput()
        text.placeHolderText = "아이디"
        text.translatesAutoresizingMaskIntoConstraints = false
        text.style = CustomTextInputStyle()
        return text
    }()
    
    let Pass_textField : AnimatedTextInput = {
        let text = AnimatedTextInput()
        text.placeHolderText = "비밀번호"
        text.translatesAutoresizingMaskIntoConstraints = false
        text.style = CustomTextInputStyle()
        return text
    }()
    
    let enter_Btn : UIButton = {
        let button  = UIButton()
        button.setTitle("확인", for: .normal)
        button.backgroundColor = Defaull_style.themeColor
        button.layer.cornerRadius = CGFloat(Defaull_style.insideTableViewCorner)
        button.setTitleColor(Defaull_style.mainTitleColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = Defaull_style.themeColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
}
