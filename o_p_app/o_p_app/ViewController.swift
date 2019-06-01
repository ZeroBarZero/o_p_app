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
        self.navigationItem.hidesBackButton = true

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        let tabBarController = UITabBarController()

        // 탐색하기
        let tabOne = UINavigationController(rootViewController: search_VC())
        let tabOneBarItem = UITabBarItem(title: "탐색하기", image: UIImage(named: "loupe"), selectedImage: UIImage(named: "loupe"))
        
        tabOne.tabBarItem = tabOneBarItem
        
        
        // 내스터디
        let tabTwo = UINavigationController(rootViewController: myStudy_VC())
        let tabTwoBarItem2 = UITabBarItem(title: "내스터디", image: UIImage(named: "pencil.png"), selectedImage: UIImage(named: "pencil.png"))
        
        tabTwo.tabBarItem = tabTwoBarItem2
        
        // 내메신저
        let tabThree = studyMessager_VC()
        let tabThreeBarItem3 = UITabBarItem(title: "내메신저", image: UIImage(named: "speech-bubble.png"), selectedImage: UIImage(named: "speech-bubble.png"))
        
        tabThree.tabBarItem = tabThreeBarItem3

        // 내정보
        let tabFour = myInfo_VC()
        let tabFourBarItem4 = UITabBarItem(title: "내정보", image: UIImage(named: "resources.png"), selectedImage: UIImage(named: "resources.png"))
        
        tabFour.tabBarItem = tabFourBarItem4
        
        self.tabBarController?.tabBar.tintColor  = .black
        tabBar.tintColor = .black
        self.viewControllers = [tabOne, tabTwo, tabThree,tabFour]
        
    }
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        
    }
    
//    // UITabBarControllerDelegate method
//    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//        print("Selected \(viewController.title!)")
//    }
}
extension UITabBarController {
    func hideTabBarAnimated(hide:Bool, completion: ((Bool)->Void)? = nil ) {
        if (tabBarIsVisible() == !hide) {
            if let completion = completion {
                return completion(true)
            }
            else {
                return
            }
        }
        // get a frame calculation ready
        let height = self.tabBar.frame.size.height
        let offsetY = (!hide ? -height : height)
        
        // zero duration means no animation
        let duration = 0.33
        
        UIView.animate(withDuration: duration, animations: {
            let frame = self.tabBar.frame
            self.tabBar.frame = frame.offsetBy(dx: 0, dy: offsetY)
        })
        
        //        switch hide {
        //        case true:
        //            UIView.animate(withDuration: 0.33, animations: {
        //                self.tabBar.transform = CGAffineTransform(translationX: 0, y: 50)
        //            }) { (finished) in
        //                if finished { self.tabBar.isHidden = hide}
        //            }
        //        case false:
        //            UIView.animate(withDuration: 0.3, animations: {
        //                self.tabBar.transform = CGAffineTransform.identity
        //            })
        //            tabBar.isHidden = hide
        //        }
    }
    func tabBarIsVisible() -> Bool {
        return self.tabBar.frame.origin.y < view.frame.maxY
    }

}
