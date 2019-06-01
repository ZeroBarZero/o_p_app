//
//  myStudy_VC.swift
//  o_p_app
//
//  Created by OOPSLA on 17/03/2019.
//  Copyright © 2019 haeun. All rights reserved.
//

import Foundation
import UIKit

// delegate
protocol myStudy_VC_delegate : class {
    func navMoveDelegate(_ sender : myStudy_V_TV)
}
class myStudy_VC : UIViewController,myStudy_VC_delegate {
    func navMoveDelegate(_ sender: myStudy_V_TV) {
        print("test")
        let moveView = studyDetail_VC()
        moveView.bottomViewCheck = false

        self.navigationController?.pushViewController(moveView, animated: true)

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        self.tabBarController?.hideTabBarAnimated(hide: false,completion: {_ in })

        navigationController?.setNavigationBarHidden(true, animated: animated)
        view.backgroundColor = .white
        
        mainView.tableView.delegate = self
        mainView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(mainView)
        let margins = view.layoutMarginsGuide
        
        NSLayoutConstraint.activate([

            mainView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 0),
            mainView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            mainView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            mainView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0)
            ])

//        mainView.tableView.tableView.layoutSubviews()
    }
    lazy var mainView  : myStudy_V = {
        let view = myStudy_V()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

}
