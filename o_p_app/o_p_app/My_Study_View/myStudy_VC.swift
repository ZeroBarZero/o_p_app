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
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
        view.backgroundColor = .white

        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.largeTitleTextAttributes =
            [NSAttributedString.Key.foregroundColor: Defaull_style.mainTitleColor]
        self.navigationController?.visibleViewController?.title = "내스터디"

        view.backgroundColor = .white
        let mainView = myStudy_V()
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

        mainView.tableView.tableView.layoutSubviews()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

}
