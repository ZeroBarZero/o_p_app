//
//  studyMesseger_VC.swift
//  o_p_app
//
//  Created by OOPSLA on 17/03/2019.
//  Copyright © 2019 haeun. All rights reserved.
//

import Foundation
import UIKit

class studyMessager_VC : UIViewController {
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)

        view.backgroundColor = .white
        let mainView = studyMesseger_V()
        mainView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(navView)
        view.addSubview(mainView)
        navView.setTitleText(s: "내메신저")
        let margins = view.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            
            navView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 0),
            navView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            navView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            

            mainView.topAnchor.constraint(equalTo: navView.bottomAnchor, constant: 0),
            mainView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            mainView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            mainView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0)
            ])

    }
    lazy var navView : customNavigationView = {
        let view = customNavigationView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

}
