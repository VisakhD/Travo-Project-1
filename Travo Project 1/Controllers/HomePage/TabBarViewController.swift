//
//  TabBarViewController.swift
//  Travo Project 1
//
//  Created by Visakh D on 23/12/21.
//

import UIKit

class TabBarViewController: UITabBarController , UITabBarControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.delegate = self
    }
    
//    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
//        if let identifier = viewController.restorationIdentifier, identifier == "post" {
//                  let vc = self.storyboard?.instantiateViewController(withIdentifier: "post") as! AddPostViewController
//                  present(vc, animated: true, completion: nil)
//                  return false
//              }
//
//              return true
//          }
//
//    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        if let controller = self.viewControllers?[self.selectedIndex] as? AddPostViewController {
//
//                  controller.modalPresentationStyle = .fullScreen
//                  self.present(controller, animated: true, completion: nil)
//               }
//    }
//
}
