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
        navigationController?.setNavigationBarHidden(false, animated: animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.title = "내메신저"
        view.backgroundColor = .white

        self.navigationController?.navigationBar.largeTitleTextAttributes =
            [NSAttributedString.Key.foregroundColor: Defaull_style.mainTitleColor]
        
        view.backgroundColor = .white
        let mainView = studyMesseger_V()
        mainView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainView)
        let margins = view.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 0),
            mainView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            mainView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            mainView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0)
            ])

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

}
