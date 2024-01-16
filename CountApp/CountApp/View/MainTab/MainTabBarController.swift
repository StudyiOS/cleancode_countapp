//
//  MainTabBarController.swift
//  CountApp
//
//  Created by 황홍필 on 2024/01/13.
//

import UIKit

final class MainTabBarController: UITabBarController {

    // MARK: - UI Components
    private let foodCount = UINavigationController(rootViewController: FoodCountController())
    private let foodTap = UINavigationController(rootViewController: FoodTapController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBarSettings()
    }
    
    private func setTabBarSettings() {
        setTabBarElements()
        setTabBarColor()
        setTabBarImage()
        setTabBarName()
    }
    
    private func setTabBarElements() {
        viewControllers = [foodCount, foodTap]
    }
    
    private func setTabBarColor() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        tabBar.backgroundColor = .countBackground
        tabBar.tintColor = .countBlack
    }
    
    private func setTabBarImage() {
        guard let items = tabBar.items else { return }
        
        items[0].image = UIImage(systemName: "fork.knife")
        items[1].image = UIImage(systemName: "hand.tap.fill")
    }
    
    private func setTabBarName() {
        foodCount.tabBarItem.title = "음식 탭"
        foodTap.tabBarItem.title = "탭 횟수"
    }

}
