//
//  FoodTapController.swift
//  CountApp
//
//  Created by 황홍필 on 2024/01/13.
//

import UIKit
import SnapKit

final class FoodTapController: UIViewController {
    // MARK: - ViewModel
    let foodTapViewModel = FoodTapViewModel()
    
    // MARK: - UI Components
    let foodView = FoodView()

    private lazy var foodViews: [FoodView] = {
        var views = [FoodView]()
        for _ in 0...foodTapViewModel.foods.count {
            let foodView = FoodView()
            foodView.layer.cornerRadius = 10
            foodView.layer.masksToBounds = true
            views.append(foodView)
        }
        return views
    }()
    
    // MARK: - Stack
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: foodViews)
        stack.axis = .vertical
        stack.spacing = 20
        stack.distribution = .fillEqually
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        makeFiveFoodsComponents()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        makeFiveFoodsComponents()
    }
    
    private func makeFiveFoodsComponents() {
        for (index, foodsViewModel) in foodTapViewModel.foods.enumerated() {
            foodViews[index].foodName.text = foodsViewModel.foodsName
            foodViews[index].foodName.textColor = .white
            foodViews[index].backgroundColor = foodsViewModel.foodsColor
            
            let userDefaults = UserDefaults.standard
            let count = userDefaults.integer(forKey: "\(index)")
            foodViews[index].foodTapCount.text = "\(count)점"
            foodViews[index].foodTapCount.textColor = .white
        }
    }
}

extension FoodTapController: ViewDrawable {
    func configureUI() {
        setNavigationUI()
        setBackgroundColor()
        setAutolayout()
    }
    
    func setBackgroundColor() {
        view.backgroundColor = .countBackground
    }
    
    func setAutolayout() {
        [stackView].forEach { view.addSubview($0) }
        
        stackView.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading).offset(20)
            make.trailing.equalTo(view.snp.trailing).offset(-20)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
            make.height.equalTo(400)
        }
    }
    
    private func setNavigationUI() {
        setNavigationTitle()
        setNavigationAppearance(with: setNavigationColor())
        setRightBarButtonItem()
    }
    
    private func setNavigationTitle() {
        self.navigationItem.title = "맛있는 음식들"
    }
    
    private func setNavigationColor() -> UINavigationBarAppearance {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .countBackground
        appearance.titleTextAttributes = [NSAttributedString.Key.font: UIFont.LINESeedRegular(size: 16) as Any, NSAttributedString.Key.foregroundColor: UIColor.countBlack
        ]
        return appearance
    }
    
    private func setNavigationAppearance(with navigationAppearnace: UINavigationBarAppearance) {
        navigationController?.navigationBar.scrollEdgeAppearance = navigationAppearnace
        navigationController?.navigationBar.standardAppearance = navigationAppearnace
    }
    
    private func setRightBarButtonItem() {
        let rightBarButton = UIBarButtonItem(title: nil, image: UIImage(systemName: "ellipsis.circle"), primaryAction: nil, menu: makeFoodTapMenu())
        rightBarButton.tintColor = .countBlack
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    private func makeFoodTapMenu() -> UIMenu {
        let reset = UIAction(title: "모두 초기화", attributes: .destructive) { action in
            print("모두 초기화 선택")
        }
        let chickenReset = UIAction(title: "치킨 초기화") { action in
            print("치킨 초기화")
        }
        
        let friedRiceReset = UIAction(title: "볶음밥 초기화") { action in
            print("볶음밥 초기화")
        }
        
        let hamburgerReset = UIAction(title: "햄버거 초기화") { action in
            print("햄버거 초기화")
        }
        
        let noodlesReset = UIAction(title: "국수 초기화") { action in
            print("국수 초기화")
        }
        
        let pizzaReset = UIAction(title: "피자 초기화") { action in
            print("피자 초기화")
        }
        
        let menu = UIMenu(children: [reset, chickenReset, friedRiceReset, hamburgerReset, noodlesReset, pizzaReset])
        return menu
    }
    
    private func resetAllCount() {
        for (index, _) in foodViews.enumerated() {
            UserDefaults.standard.removeObject(forKey: "\(index)")
        }
    }
    
    private func resetChickenCount(with button: UIButton) {
        let count = UserDefaults.standard.integer(forKey: "\(button.tag)")
        UserDefaults.standard.set(count + 1, forKey: "\(button.tag)")
    }
    
    private func plusFiveCount(with button: UIButton) {
        let count = UserDefaults.standard.integer(forKey: "\(button.tag)")
        UserDefaults.standard.set(count + 5, forKey: "\(button.tag)")
    }
    
    private func plusTenCount(with button: UIButton) {
        let count = UserDefaults.standard.integer(forKey: "\(button.tag)")
        UserDefaults.standard.set(count + 10, forKey: "\(button.tag)")
    }
}

