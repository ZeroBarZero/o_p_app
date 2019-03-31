//
//  add_Study_VC.swift
//  o_p_app
//
//  Created by OOPSLA on 24/03/2019.
//  Copyright © 2019 haeun. All rights reserved.
//

import Foundation
import UIKit

class add_Study_VC : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.view.addSubview(scrollView)
        scrollView.addSubview(mainView)
        
        let margins = view.layoutMarginsGuide

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
//            scrollView.heightAnchor.constraint(equalToConstant: 1000),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
            
            mainView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
            mainView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            mainView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            // FIXIT : 오토 height 으로 바꾸기.
//            mainView.heightAnchor.constraint(equalToConstant: 1000),
            
            mainView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0)
            ])
        

//        self.view.addSubview(add_Study_V)
    }
    let scrollView: UIScrollView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .cyan
        return v
    }()
    var mainView : add_Study_V_2 = {
        let view = add_Study_V_2()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
}
