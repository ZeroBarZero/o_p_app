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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

    }
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
    }
    func initView(){
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.visibleViewController?.title = "탐색하기"
        self.navigationController?.navigationBar.largeTitleTextAttributes =
            [NSAttributedString.Key.foregroundColor: Defaull_style.mainTitleColor]
        self.navigationItem.leftBarButtonItem?.tintColor = Defaull_style.mainTitleColor
        self.navigationItem.rightBarButtonItem?.tintColor = Defaull_style.mainTitleColor
        self.navigationController?.navigationBar.tintColor = Defaull_style.mainTitleColor
        
        // 뷰 겹치는거 방지
        self.navigationController!.navigationBar.isTranslucent = false
        // 까만거 지우려고
        self.navigationController!.view.backgroundColor = .white
        // 아래 그림자 생기는거 지우기
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        
        view.backgroundColor = .white
        let mainView = search_V()
        mainView.translatesAutoresizingMaskIntoConstraints = false
        // delegate 위해
        mainView.recommendationCollectView.delegate = self
        
        view.addSubview(scrollView)
        scrollView.addSubview(mainView)
        
        // layout
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
            
            mainView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
            mainView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 0),
            mainView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 0),
            // FIXIT : 오토 height 으로 바꾸기.
            mainView.heightAnchor.constraint(equalToConstant: 1000),
            
            mainView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0)
            ])
        

    }
    @objc func addBtnEvent(){
        DispatchQueue.main.async
            {
                self.navigationController?.pushViewController(add_Study_VC(), animated: true)
        }
    }
    let scrollView: UIScrollView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .cyan
        return v
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initView()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBtnEvent))
        
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem = add

    }
}

