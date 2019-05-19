//
//  add_study2_VC.swift
//  o_p_app
//
//  Created by OOPSLA on 14/04/2019.
//  Copyright © 2019 haeun. All rights reserved.
//

import Foundation
import UIKit
import AnimatedTextInput
import RxCocoa
import RxSwift

protocol add_study2_VC_Delegate {
    func backBtn()
    
    func step1_Next()
    func step2_Next()
    func step2_Prev()
    func step3_Next()
    func step3_Prev()
    
    func step2_timeSelectView(index : Int)
    func step2_timepassing(s:String)
    func step2_memberSelectView()
    func step2_memberSelectView_passingMemberValue(s:String)
    func step2_offlineSelectView()
}

class add_study2_VC: UIViewController, add_study2_VC_Delegate,UIGestureRecognizerDelegate {
    
    var disposeBag = DisposeBag()
    let leadingPadding = CGFloat(20)

    var heightConstraint : NSLayoutConstraint?
    var locationHeightconstraint : NSLayoutConstraint?
    
    // step2 time table index
    var currentIndex : Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        navView.backBtn.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        initView()
    }
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true

        self.tabBarController?.hideTabBarAnimated(hide: true,completion: {_ in })

        navigationController?.setNavigationBarHidden(true, animated: true)

        hideKeyboardWhenTappedAround()

        self.view.backgroundColor = .white
//        self.navigationController?.navigationBar.prefersLargeTitles = true
//        self.navigationController?.visibleViewController?.title = "새로운 스터디 만들기"
        step1.delegate = self
        step2.delegate = self
        step3.delegate = self
        step2.week_selectView.delegate = self

        Observable.combineLatest(
            // id, pw  둘 다 바뀌면
            step1.studyTitleTextInput.rx.text.orEmpty.map(check),
            step1.studyInfoTextInput.rx.text.orEmpty.map(check),
            resultSelector : {s1,s2 in s1 && s2}
            )
            .subscribe(onNext : { b  in
                self.step1.next1_Btn.isEnabled = b
                if b == true{
                    self.step1.next1_Btn.backgroundColor = #colorLiteral(red: 1, green: 0.3768762648, blue: 0.6086360216, alpha: 1)
                }else{
                    self.step1.next1_Btn.backgroundColor = #colorLiteral(red: 0, green: 0.6043059826, blue: 0.614680171, alpha: 1)
                }
            })
            .disposed(by: disposeBag)
    }
    @objc func buttonClicked() {
//        print("Button Clicked")
        self.navigationController?.popViewController(animated: true)
    }
    func initView(){
        

        step2.isHidden = true
        step3.isHidden = true
        step1.isHidden = false
        
        view.addSubview(navView)
        view.addSubview(step1)
        view.addSubview(step2)
        view.addSubview(step3)
        
        navView.setTitleText(s: "새로운 스터디 만들기")
        NSLayoutConstraint.activate([
            navView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor,constant: 0),
            navView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            navView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),

            ])
        NSLayoutConstraint.activate([
            step1.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: 0),
            step1.topAnchor.constraint(equalTo: navView.bottomAnchor, constant: 0),
            step1.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: 0),

//            step1.heightAnchor.constraint(equalTo: self.view.heightAnchor, constant: 0),
            ])
        NSLayoutConstraint.activate([
            step2.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: 0),
//            step2.heightAnchor.constraint(equalTo: self.view.heightAnchor, constant: 0),
            step2.topAnchor.constraint(equalTo: navView.bottomAnchor, constant: 0),
            step2.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: 0),

            ])
        NSLayoutConstraint.activate([
            step3.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: 0),
//            step3.heightAnchor.constraint(equalTo: self.view.heightAnchor, constant: 0),
            step3.topAnchor.constraint(equalTo: navView.bottomAnchor, constant: 0),
            step3.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: 0),

            ])
    }
    func check( _ s : String) -> Bool{
        return s.count > 0
    }
    func backBtn(){
        self.navigationController?.popViewController(animated: true)
    }
    func step1_Next() {
        view.endEditing(true)
        showAnimateNextView(currentView: step1, willView: step2)
    }
    
    func step2_Next() {
        view.endEditing(true)
        step1.isHidden = true
        showAnimateNextView(currentView:step2,willView:step3)
    }
    
    func step2_Prev() {
        view.endEditing(true)
        showAnimatePrevView(currentView: step2, willView: step1)
    }
    
    func step3_Next() {
        step1.isHidden = true
        step2.isHidden = true
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    func step3_Prev() {
        showAnimatePrevView(currentView: step3, willView: step2)
    }

    func showAnimateNextView(currentView:UIView,willView:UIView){
        willView.transform = CGAffineTransform.identity.translatedBy(x: self.view.bounds.width, y: 0)
        willView.isHidden = false
        UIView.animate(withDuration: 0.7, animations: {
            willView.transform = CGAffineTransform(translationX: 0, y: 0)
            currentView.transform = CGAffineTransform(translationX: -(self.view.bounds.width), y: 0)
        }, completion: { _ in
            currentView.isHidden = true
            // 뷰컨트롤 스와이프할 때 뷰 겹쳐보이는거 노노
        })
    }
    func showAnimatePrevView(currentView:UIView,willView:UIView){
        willView.transform = CGAffineTransform.identity.translatedBy(x: -self.view.bounds.width, y: 0)
        willView.isHidden = false
        UIView.animate(withDuration: 0.7, animations: {
            willView.transform = CGAffineTransform(translationX: 0, y: 0)
            currentView.transform = CGAffineTransform(translationX: (self.view.bounds.width), y: 0)
        }, completion: { _ in
            currentView.isHidden = true
        })
    }

    func show_step3() {
        step1.isHidden = true
        step2.isHidden = true
        step3.isHidden = false

        view.addSubview(step3)
        
        NSLayoutConstraint.activate([
            step3.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: 0),
            step3.heightAnchor.constraint(equalTo: self.view.heightAnchor, constant: 0),
            ])
    }
    func step2_memberSelectView(){
        let vc = add_Study_selectPeople_popVIew()
        vc.delegate = self
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true, completion: nil)
    }
    func step2_memberSelectView_passingMemberValue(s:String){
        step2.member_selection.text = s
    }
    
    func step2_timeSelectView(index : Int) {
        print("test")
        let vc = add_Study_table_cell_popupView()
        vc.delegate = self
        currentIndex = index
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true, completion: nil)
    }
    func step2_timepassing(s:String){
        //        print(s)
        step2.week_selectView.weekData[currentIndex!] = s
        step2.week_selectView.tableView.reloadData()
    }
    func step2_offlineSelectView(){
        let view = offlineSearch_VC()
        self.navigationController?.pushViewController(view, animated: true)
    }
    lazy var navView : customNavigationViewWithBack = {
        let view = customNavigationViewWithBack()
//        view.backBtn.addTarget(self, action: #selector(buttonClicked), for: .touchDown)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var step1 : add_study2_V_step1 = {
        let view = add_study2_V_step1()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var step2 : add_study2_V_step2 = {
        let view = add_study2_V_step2()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var step3 : add_study2_V_step3 = {
        let view = add_study2_V_step3()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()


    
}

// 키보드 닫는 이벤트
extension add_study2_VC {
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(hideKeyboard))
        // 없으면 테이블 뷰 셀(didselect) 셀렉트 이벤트같은 것들 무시하기 때문에 꼭 써줘야 함..
        tapGesture.cancelsTouchesInView = false
        step1.addGestureRecognizer(tapGesture)
        step2.addGestureRecognizer(tapGesture)
        step3.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyboard() {
        
        view.endEditing(true)
    }
}
