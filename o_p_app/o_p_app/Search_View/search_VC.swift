//
//  search_VC.swift
//  o_p_app
//
//  Created by OOPSLA on 17/03/2019.
//  Copyright © 2019 haeun. All rights reserved.
//

import UIKit

class search_VC: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.largeTitleTextAttributes =
            [NSAttributedString.Key.foregroundColor: Defaull_style.mainTitleColor]
        
        view.backgroundColor = .white
        let mainView = search_V()
        mainView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainView)
        let margins = view.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 0),
            mainView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 0),
            mainView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 0),
            mainView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0)
            ])
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

