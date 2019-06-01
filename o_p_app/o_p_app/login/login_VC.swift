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
    private var mainViewCenterYanchor: NSLayoutConstraint?
    private var mainViewTopAnchor: NSLayoutConstraint?
    private var checkShow = false
    private var keyBoardSize : CGFloat?
    private var mainHeight : CGFloat?
    
    let gradient = CAGradientLayer()
    var gradientSet = [[CGColor]]()
    var currentGradient: Int = 0
    
    let gradientOne = #colorLiteral(red: 0, green: 0.7658619881, blue: 0.6070138812, alpha: 1).cgColor
    let gradientTwo = #colorLiteral(red: 0.6572234035, green: 0.7572737336, blue: 0.6016023755, alpha: 1).cgColor
    let gradientThree = #colorLiteral(red: 1, green: 0.7414783835, blue: 0.5916962028, alpha: 1).cgColor


    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("will check")
//        IQKeyboardManager.shared.enable = true
//        navigationController?.setNavigationBarHidden(true, animated: true)
        gradientInit()
        initView()
//        check()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
        mainHeight = mainView.frame.height
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        print("test")
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
    // 나중에 서버랑 연결할 때 사용할 함수
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
    // 키보드 올라오거나 내려갈 때 뷰 이동시키는 함수
    fileprivate func handleKeyboardIssue(notification: Notification, isAppearing: Bool) {
        // 1. 키보드 높이 구함
        guard let userInfo = notification.userInfo as? [String:Any] else {return}
        guard let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {return}
        guard let keyboardShowAnimateDuartion = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber else {return}
        let keyboardHeight = keyboardFrame.cgRectValue.height
        
        let heightConstant = isAppearing ? keyboardHeight : 0
        
        // 2. 어차피 모든 뷰는 mainView에 귀속되어있기 때문에 mainView 의 centerYanchor 를 topAnchor 로 바꿈
        let topSize = (self.view.frame.height - heightConstant) - mainView.frame.height

        if checkShow {
            if mainViewTopAnchor != nil {
                // 키보드의 자동 passWords 가 두번 실행하기 때문에 만약 true일 때
                // false로 한번 해주고 해야함.
                if mainViewTopAnchor!.isActive{
                    mainViewTopAnchor!.isActive = false
                }
            }
            mainViewCenterYanchor?.isActive = false
            mainViewTopAnchor = mainView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: topSize/2)
            mainViewTopAnchor!.isActive = true
        }else{
            mainViewTopAnchor!.isActive = false
            mainViewCenterYanchor?.isActive = true
        }

        UIView.animate(withDuration: keyboardShowAnimateDuartion.doubleValue) {
            self.view.layoutIfNeeded()
        }
    }

    @objc func keyboardWillHide(_ notification: Notification){
        print("Keyboard hide")
        checkShow = false
        handleKeyboardIssue(notification: notification, isAppearing: false)
    }
    
    @objc func keyboardWillShow(_ notification: Notification){
        print("Keyboard show")
         checkShow = true
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
        text.style = loginCustomTextInputStyle()
        return text
    }()
    
    let Pass_textField : AnimatedTextInput = {
        let text = AnimatedTextInput()
        text.placeHolderText = "비밀번호"
        text.type = .password(toggleable: true)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.style = loginCustomTextInputStyle()
        return text
    }()
    
    let enter_Btn : UIButton = {
        let button  = UIButton()
        button.isEnabled = false
        button.setTitle("정보를 정확히 입력해주세요.", for: .disabled)
        button.setTitle("확인", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0, green: 0.6043059826, blue: 0.614680171, alpha: 1)
        button.layer.cornerRadius = CGFloat(Defaull_style.insideTableViewCorner)
        button.setTitleColor(Defaull_style.mainTitleColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        button.setTitleColor(UIColor.white, for: .normal)
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
//        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    // MARK : Set View
    private func initView(){
        hideKeyboardWhenTappedAround()
        signView.addSubview(signInLabel)
        signView.addSubview(signInButton)

        mainView.addSubview(ID_textField)
        mainView.addSubview(Pass_textField)
        mainView.addSubview(enter_Btn)
        mainView.addSubview(signView)
        
        view.addSubview(mainView)
        
        enter_Btn.addTarget(self, action: #selector(moveView), for: .touchDown)
        
        let margin = Defaull_style.defaultPadding
        
        mainViewCenterYanchor = mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0)
        mainViewCenterYanchor?.isActive = true
        
        
        NSLayoutConstraint.activate([
        
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
            signView.heightAnchor.constraint(equalToConstant: 40),
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
// 뷰 아무곳이나 누르면 키보드 내려가게
extension login_VC {
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyboard() {
        
        view.endEditing(true)
    }
}

extension login_VC : CAAnimationDelegate{
    func gradientInit(){
        
        gradientSet.append([gradientOne, gradientTwo])
        gradientSet.append([gradientTwo, gradientThree])
        gradientSet.append([gradientThree, gradientOne])
        
        // create the gradient layer
        let gradient = CAGradientLayer()
        gradient.frame = self.view.bounds
        gradient.colors = gradientSet[currentGradient]
        gradient.startPoint = CGPoint(x:0.0, y:0.5)
        gradient.endPoint = CGPoint(x:1.0, y:0.5)
        gradient.locations =  [-0.5, 1.5]
        
        let animation = CABasicAnimation(keyPath: "colors")
        animation.fromValue = [gradientOne, gradientTwo,gradientThree]
        animation.toValue = [gradientThree, gradientTwo, gradientOne]
        animation.duration = 5.0
        animation.autoreverses = true
        animation.repeatCount = Float.infinity
        
        gradient.add(animation, forKey: nil)
        self.view.layer.addSublayer(gradient)
        
    }
    func animateGradient() {
        if currentGradient < gradientSet.count - 1 {
            currentGradient += 1
        } else {
            currentGradient = 0
        }
        
        let gradientChangeAnimation = CABasicAnimation(keyPath: "colors")
        gradientChangeAnimation.duration = 5.0
        gradientChangeAnimation.toValue = gradientSet[currentGradient]
        gradientChangeAnimation.fillMode = CAMediaTimingFillMode.forwards
        gradientChangeAnimation.isRemovedOnCompletion = false
        gradient.add(gradientChangeAnimation, forKey: "colorChange")
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag {
            gradient.colors = gradientSet[currentGradient]
            animateGradient()
        }
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
struct loginCustomTextInputStyle: AnimatedTextInputStyle {
    let placeholderInactiveColor = #colorLiteral(red: 0, green: 0.6043059826, blue: 0.614680171, alpha: 1)      //입력 전
    let activeColor = #colorLiteral(red: 1, green: 0.3768762648, blue: 0.6086360216, alpha: 1)            //입력 시
    let inactiveColor = #colorLiteral(red: 0, green: 0.6043059826, blue: 0.614680171, alpha: 1)         // 다 입력완료
    let lineInactiveColor = #colorLiteral(red: 0, green: 0.6043059826, blue: 0.614680171, alpha: 1)    //  입력 완료 라인
    let lineActiveColor = #colorLiteral(red: 1, green: 0.3768762648, blue: 0.6086360216, alpha: 1)  // 입력 시 라인
    // 아래 라인 높이
    let lineHeight: CGFloat = 1
    let errorColor = UIColor.red
    let textInputFont = UIFont.systemFont(ofSize: 15)
    let textInputFontColor = UIColor.black
    let placeholderMinFontSize: CGFloat = 12
    let counterLabelFont: UIFont? = UIFont.systemFont(ofSize: 12)
    let leftMargin: CGFloat = 5
    let topMargin: CGFloat = 30
    let rightMargin: CGFloat = 0
    let bottomMargin: CGFloat = 10
    let yHintPositionOffset: CGFloat = 7
    let yPlaceholderPositionOffset: CGFloat = 0
    public let textAttributes: [String: Any]? = nil
}
