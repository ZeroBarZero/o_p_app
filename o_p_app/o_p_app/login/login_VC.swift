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
import RxSwift
import RxCocoa

class login_VC : UIViewController {
    var disposeBag = DisposeBag()
    private var id_bottomAnchor: NSLayoutConstraint?
    private var pw_bottomAnchor: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        IQKeyboardManager.shared.enable = true
//
//        view.backgroundColor = .white
//
//        initView()
//        check()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        IQKeyboardManager.shared.enable = true
        navigationController?.setNavigationBarHidden(true, animated: true)

        view.backgroundColor = .white
        
        initView()
        check()

    }
    

    private func check(){
        Observable.combineLatest(
            // id, pw  둘 다 바뀌면
            ID_textField.rx.text.orEmpty.map(checkIdValid),
            Pass_textField.rx.text.orEmpty.map(checkPasswordValid),
            resultSelector : { s1, s2 in s1 && s2}
            )
            .subscribe(onNext : { b in
                self.enter_Btn.isEnabled = b
            })
            .disposed(by: disposeBag)
        

    }
    // MARK : id and password check!
    private func checkIdValid(_ id: String) -> Bool {
        return id.contains("@") && id.contains(".")
    }
    
    private func checkPasswordValid(_ password: String) -> Bool {
        return password.count > 5
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
    fileprivate func handleKeyboardIssue(notification: Notification, isAppearing: Bool) {
        guard let userInfo = notification.userInfo as? [String:Any] else {return}
        guard let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {return}
        guard let keyboardShowAnimateDuartion = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber else {return}
        let keyboardHeight = keyboardFrame.cgRectValue.height
        
        let heightConstant = isAppearing ? keyboardHeight : 0
        
        if ID_textField.resignFirstResponder() {
            id_bottomAnchor?.constant = heightConstant
        }
        else if Pass_textField.resignFirstResponder() {
            pw_bottomAnchor?.constant = heightConstant
        }
//        inputViewBottomAnchor.constant = heightConstant
        UIView.animate(withDuration: keyboardShowAnimateDuartion.doubleValue) {
            self.view.layoutIfNeeded()
        }
    }

    @objc func keyboardWillHide(_ notification: Notification){
        print("Keyboard hide")
        handleKeyboardIssue(notification: notification, isAppearing: false)
    }
    
    @objc func keyboardWillShow(_ notification: Notification){
        print("Keyboard show")
        handleKeyboardIssue(notification: notification, isAppearing: true)
    }

    let mainView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
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
        text.type = .password(toggleable: true)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.style = CustomTextInputStyle()
        return text
    }()
    
    let enter_Btn : UIButton = {
        let button  = UIButton()
        button.isEnabled = false
        button.setTitle("정보를 정확히 입력해주세요.", for: .disabled)
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
    let signInLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "계정이 없으신가요? "
        label.textColor = Defaull_style.grayTitleColor
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        return label
    }()
    let signInButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("가입하기", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        button.setTitleColor(Defaull_style.mainTitleColor, for: .normal)
        return button
    }()
    let signView : UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    // MARK : Set View
    private func initView(){
        
        signView.addSubview(signInLabel)
        signView.addSubview(signInButton)

        mainView.addSubview(ID_textField)
        mainView.addSubview(Pass_textField)
        mainView.addSubview(enter_Btn)
        mainView.addSubview(signView)
        
        view.addSubview(mainView)
        
        enter_Btn.addTarget(self, action: #selector(moveView), for: .touchDown)
        
        let margin = Defaull_style.defaultPadding
        
        NSLayoutConstraint.activate([
            mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            mainView.widthAnchor.constraint(equalToConstant: view.frame.width),
            
            ID_textField.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 0),
            ID_textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin),
            ID_textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin),
            
            
            Pass_textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin),
            Pass_textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin),
            
            
            enter_Btn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            enter_Btn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            enter_Btn.heightAnchor.constraint(equalToConstant: 50),
//            enter_Btn.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: 0),
            
            signView.topAnchor.constraint(equalTo: enter_Btn.bottomAnchor, constant: 40),
            signView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
//            signView.widthAnchor.constraint(equalToConstant: view.frame.width),
            signView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: 0),
            
            signInLabel.centerYAnchor.constraint(equalTo: signView.centerYAnchor, constant: 0),
            signInLabel.leadingAnchor.constraint(equalTo: signView.leadingAnchor, constant: 0),
            
            signInButton.centerYAnchor.constraint(equalTo: signView.centerYAnchor, constant: 0),
            signInButton.leadingAnchor.constraint(equalTo: signInLabel.trailingAnchor, constant: 10),
            signInButton.trailingAnchor.constraint(equalTo: signView.trailingAnchor, constant: 0),
            ])
        
        id_bottomAnchor = ID_textField.bottomAnchor.constraint(equalTo: Pass_textField.topAnchor, constant: 0)
        id_bottomAnchor?.isActive = true
        
        pw_bottomAnchor = Pass_textField.bottomAnchor.constraint(equalTo: enter_Btn.topAnchor, constant: -10)
        pw_bottomAnchor?.isActive = true
    }

}
// Mark RxSwift with AnimatedTextInput
extension Reactive where Base: AnimatedTextInput {
    /// Reactive wrapper for `text` property.
    public var text: ControlProperty<String?> {
        return value
    }
    
    /// Reactive wrapper for `text` property.
    public var value: ControlProperty<String?> {
        return base.rx.controlPropertyWithDefaultEvents(
            getter: { textField in
                textField.text
        },
            setter: { textField, value in
                // This check is important because setting text value always clears control state
                // including marked text selection which is imporant for proper input
                // when IME input method is used.
                if textField.text != value {
                    textField.text = value
                }
        }
        )
    }
    fileprivate func controlPropertyWithDefaultEvents<T>(
        editingEvents: UIControl.Event = [.allEditingEvents, .valueChanged],
        getter: @escaping (Base) -> T,
        setter: @escaping (Base, T) -> ()
        ) -> ControlProperty<T> {
        return controlProperty(
            editingEvents: editingEvents,
            getter: getter,
            setter: setter
        )
    }
}
