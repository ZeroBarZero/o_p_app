//
//  studyDetail_VC.swift
//  o_p_app
//
//  Created by OOPSLA on 20/03/2019.
//  Copyright © 2019 haeun. All rights reserved.
//

import Foundation
import UIKit

class studyDetail_VC : UIViewController {
    // 내 스터디가 아닌 경우에는 없앰
    var bottomViewCheck : Bool? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)

        // 뷰 겹치는거 방지
        self.navigationController!.navigationBar.isTranslucent = false
        self.navigationItem.title = "내스터디"
        // 아래 그림자 생기는거 지우기
//        self.navigationController?.navigationBar.shadowImage = UIImage()

        self.view.backgroundColor = .white
        self.view.addSubview(mainView)
//        self.view.addSubview(bottomView)
        // layout
        let margins = view.layoutMarginsGuide
        
        let height = Int(self.view.frame.height/8)

        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 0),
            mainView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 0),
            mainView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 0),
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
    }
    @objc func leftBarBtnAction() {
        self.dismiss(animated: true, completion: nil)
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
