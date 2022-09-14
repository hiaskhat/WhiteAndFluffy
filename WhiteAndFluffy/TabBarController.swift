//
//  RootViewController.swift
//  WhiteAndFluffy
//
//  Created by Асхат Баймуканов on 04.09.2022.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        generateTabBar()
        
    }
    
    private func generateTabBar() {
        viewControllers = [
            generateVC(
                viewController: HomeViewController(),
                title: "Home",
                image: UIImage(systemName: "house.fill")),
            generateVC(
                viewController: FavoriteViewController(),
                title: "Favorite",
                image: UIImage(systemName: "heart.fill"))
        ]
    }
 
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        
        return UINavigationController(rootViewController: viewController)
    }
    

}
