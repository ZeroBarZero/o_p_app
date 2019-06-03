//
//  studyDetail_VC.swift
//  o_p_app
//
//  Created by OOPSLA on 20/03/2019.
//  Copyright © 2019 haeun. All rights reserved.
//

import Foundation
import UIKit

// delegate...
protocol studyDetail_VC_Delegate {
    func alertDelegate()
}
class studyDetail_VC : UIViewController, studyDetail_VC_Delegate,UIGestureRecognizerDelegate{
    
    /// 뷰의 bottom 을 선언한다. 가입 신청 뷰를
    var bottomConstraint : NSLayoutConstraint?
    
    func alertDelegate() {
        let showAlert = UIAlertController(title: "가입신청이벤트", message: "그냥나중에이벤트", preferredStyle: .alert)
        
        showAlert.addAction(UIAlertAction(title: "넵", style: .default, handler: nil))
        showAlert.addAction(UIAlertAction(title: "아나용", style: .cancel, handler: nil))
        
        self.present(showAlert, animated: true)

    }
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }

    // 내 스터디가 아닌 경우에는 없앰
    var bottomViewCheck : Bool? = nil
    @objc func buttonClicked() {
        self.navigationController?.popViewController(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.navView.backBtn.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true

        mainView.navView.setTitleText(s: "코딩 테스트 온라인 스터디")
        self.tabBarController?.hideTabBarAnimated(hide: true,completion: {_ in })

        navigationController?.setNavigationBarHidden(true, animated: true)
        bottomView.delegate = self
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.leftBarButtonItem?.tintColor = Defaull_style.mainTitleColor
        self.navigationItem.rightBarButtonItem?.tintColor = Defaull_style.mainTitleColor
        self.navigationController?.navigationBar.tintColor = Defaull_style.mainTitleColor
        

        self.view.backgroundColor = .white
        
        view.addSubview(mainView)

        let height = Int(self.view.frame.height/8)

        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 0),
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
//            mainView.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: 0)
            ])
        // bottomView 확인
        if bottomViewCheck != nil && bottomViewCheck == true {
            
            self.view.addSubview(bottomView)
            NSLayoutConstraint.activate([
                bottomView.heightAnchor.constraint(equalToConstant: CGFloat(height)),
                bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                bottomView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
                bottomView.topAnchor.constraint(equalTo: mainView.bottomAnchor, constant: 0)
                ])
        }
        
        if bottomViewCheck == false {
            let heartBtn = UIBarButtonItem(image: #imageLiteral(resourceName: "icon_5656_heart"), style: .plain, target: self, action: #selector(heartBtnEvent))
            let messegeBtn = UIBarButtonItem(image: #imageLiteral(resourceName: "icon_5656_message"), style: .plain, target: self, action: #selector(messegaBtnEvent))
            self.navigationItem.rightBarButtonItems = [heartBtn,messegeBtn]
        }
    }
    @objc func heartBtnEvent() {
        alertDelegate()
    }
    @objc func messegaBtnEvent() {
        alertDelegate()
    }
    let mainView : studyDetail_V = {
        let view = studyDetail_V()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let bottomView : studyDetail_Bottom_V = {
        let view = studyDetail_Bottom_V()
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowOpacity = 0.2
        view.layer.shadowRadius = 4.0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
}
