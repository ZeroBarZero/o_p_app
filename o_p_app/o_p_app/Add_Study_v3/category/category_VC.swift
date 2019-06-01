//
//  category_VC.swift
//  o_p_app
//
//  Created by OOPSLA on 05/05/2019.
//  Copyright © 2019 haeun. All rights reserved.
//

import Foundation
import UIKit

class category_VC : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: true)

        // 뷰 겹치는거 방지
        self.navigationController!.navigationBar.isTranslucent = false
        // 까만거 지우려고
        self.navigationController!.view.backgroundColor = .white
        // 아래 그림자 생기는거 지우기
        self.navigationController?.navigationBar.shadowImage = UIImage()

        self.navigationController?.visibleViewController?.title = "카테고리"
        view.backgroundColor = .white

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.navigationController?.navigationBar.prefersLargeTitles = false

        view.addSubview(categoryRecomendCollectView)
        NSLayoutConstraint.activate([
            categoryRecomendCollectView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
            categoryRecomendCollectView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Defaull_style.defaultPadding),
            categoryRecomendCollectView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Defaull_style.defaultPadding),
            categoryRecomendCollectView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            ])
    }
    let categoryRecomendCollectView : categoryCollectView = {
        let collect = categoryCollectView()
        collect.backgroundColor = .white
        collect.translatesAutoresizingMaskIntoConstraints = false
        return collect
    }()

}
