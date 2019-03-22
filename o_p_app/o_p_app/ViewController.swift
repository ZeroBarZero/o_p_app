//
//  ViewController.swift
//  o_p_app
//
//  Created by OOPSLA on 17/03/2019.
//  Copyright © 2019 haeun. All rights reserved.
//

import Foundation
import UIKit
class ViewController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Assign self for delegate for that ViewController can respond to UITabBarControllerDelegate methods
        self.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let tabBarController = UITabBarController()

        // 탐색하기
        let tabOne = search_VC()
        let tabOneBarItem = UITabBarItem(title: "탐색하기", image: UIImage(named: "defaultImage.png"), selectedImage: UIImage(named: "selectedImage.png"))
        
        tabOne.tabBarItem = tabOneBarItem
        
        
        // 내스터디
        let tabTwo = myStudy_VC()
        let tabTwoBarItem2 = UITabBarItem(title: "내스터디", image: UIImage(named: "defaultImage2.png"), selectedImage: UIImage(named: "selectedImage2.png"))
        
        tabTwo.tabBarItem = tabTwoBarItem2
        
        // 내메신저
        let tabThree = studyMessager_VC()
        let tabThreeBarItem3 = UITabBarItem(title: "내메신저", image: UIImage(named: "defaultImage2.png"), selectedImage: UIImage(named: "selectedImage2.png"))
        
        tabThree.tabBarItem = tabThreeBarItem3

        // 내정보
        let tabFour = myInfo_VC()
        let tabFourBarItem4 = UITabBarItem(title: "내정보", image: UIImage(named: "defaultImage2.png"), selectedImage: UIImage(named: "selectedImage2.png"))
        
        tabFour.tabBarItem = tabFourBarItem4
        
        
        self.viewControllers = [tabOne, tabTwo, tabThree,tabFour]
        
    }
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        
    }
    
//    // UITabBarControllerDelegate method
//    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//        print("Selected \(viewController.title!)")
//    }
}
