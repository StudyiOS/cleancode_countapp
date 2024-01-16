//
//  ViewController.swift
//  CountApp
//
//  Created by 황홍필 on 2024/01/13.
//

import UIKit
import SnapKit

final class FoodCountController: UIViewController {
    // MARK: - ViewModel
    let foodCountViewModel = FoodCountViewModel()
    
    // MARK: - UI Components
    private let tapCount: UILabel! = nil
    
    private lazy var foodButtons: [UIButton] = {
        var views = [UIButton]()
        for (index, button) in foodCountViewModel.foods.enumerated() {
            let foodView = UIButton()
            foodView.tag = index
            foodView.addTarget(self, action: #selector(foodButtonTapped), for: .touchUpInside)
            views.append(foodView)
        }
        return views
    }()
    
    // MARK: - StackView
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: foodButtons)
        stack.axis = .vertical
        stack.distribution = .fillEqually
        return stack
    }()
    
    private func makeFiveFoodsComponents() {
        for (index, foodsViewModel) in foodCountViewModel.foods.enumerated() {
            let image = UIImage(named: foodsViewModel.foodsImageName)?.withRenderingMode(.alwaysTemplate)
            foodButtons[index].setImage(image, for: .normal)
            foodButtons[index].tintColor = .white
            foodButtons[index].backgroundColor = foodsViewModel.foodsColor
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeFiveFoodsComponents()
        setContextMenu()
        configureUI()
    }
    
    private func setContextMenu() {
        for foodbutton in foodButtons {
            let reset = UIAction(title: "모두 초기화", attributes: .destructive) { [weak self] action in
                self?.resetAllCount()
            }
            let plusOne = UIAction(title: "+1") { [weak self] action in
                self?.plusOneCount(with: foodbutton)
            }
            let plusFive = UIAction(title: "+5") { [weak self] action in
                self?.plusFiveCount(with: foodbutton)
            }
            let plusTen = UIAction(title: "+10") { [weak self] action in
                self?.plusTenCount(with: foodbutton)
            }
            
            let menu = UIMenu(children: [reset, plusOne, plusFive, plusTen])
            foodbutton.menu = menu
        }
    }
    
    private func resetAllCount() {
        for (index, _) in foodButtons.enumerated() {
            UserDefaults.standard.removeObject(forKey: "\(index)")
        }
    }
    
    private func plusOneCount(with button: UIButton) {
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
    
    // MARK: - @objc
    @objc func foodButtonTapped(_ button: UIButton) {
        let count = UserDefaults.standard.integer(forKey: "\(button.tag)")
        // 1. +1을 더한 값을 FoodTapController로 넘겨야 하고
        sendFoodTap(count, to: button)
        // 2. +1이 더해진다는 것을 애니메이션 효과를 통해 보여줘야 함
        makeTapCountAnimation(count, to: button)
    }
    
    private func sendFoodTap(_ count: Int, to button: UIButton) {
        UserDefaults.standard.set(count + 1, forKey: "\(button.tag)")
    }
    
    private func makeTapCountAnimation(_ count: Int, to button: UIButton) {
        
    }
}

extension FoodCountController: ViewDrawable {
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
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    private func setNavigationUI() {
        setNavigationTitle()
        setNavigationAppearance(with: setNavigationColor())
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
}



