//
//  search_VC.swift
//  o_p_app
//
//  Created by OOPSLA on 17/03/2019.
//  Copyright © 2019 haeun. All rights reserved.
//

import UIKit

// view에서 nav로 다른 view로 이동할 때 사용하는 delegate 정의
protocol search_VC_delegate : class {
    func navMoveDelegate(_ sender : recommendationCollectionView, index : Int )
}

class search_VC: UIViewController,search_VC_delegate {
    func navMoveDelegate(_ sender: recommendationCollectionView     , index: Int) {
        print("델리게이트")
        let moveView = studyDetail_VC()
        moveView.bottomViewCheck = true
            
        self.navigationController?.pushViewController(moveView, animated: true)
    }
    var search_Collection : recommendationCollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mainView.navView.plusBtn.addTarget(self, action: #selector(addBtnEvent), for: .touchUpInside)
    }
//    @objc func plusEvent(){
//
//    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.hideTabBarAnimated(hide: false,completion: {_ in })

        navigationController?.setNavigationBarHidden(true, animated: true)

//        DispatchQueue.main.async {
//            let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.addBtnEvent))
//            self.navigationController?.navigationBar.topItem?.rightBarButtonItem = add
//
//        }
        initView()
        
    }

    func initView(){        
        view.backgroundColor = .white

        mainView.recommendationCollectView.delegate = self
        
        view.addSubview(mainView)
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 0),
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            mainView.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: 0),
            
            ])
        mainView.categoryRecomenBtn.addTarget(nil, action: #selector(categoryBtnEvent), for: .touchDown)

    }
    @objc func addBtnEvent(){
        DispatchQueue.main.async
            {
                self.navigationController?.pushViewController(add_study2_VC(), animated: true)
        }
    }
    @objc func categoryBtnEvent(){
        self.navigationController?.pushViewController(category_VC(), animated: true)
    }
    let mainView: search_V = {
        let v = search_V()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
//        v.delaysContentTouches = false
        return v
    }()

}

