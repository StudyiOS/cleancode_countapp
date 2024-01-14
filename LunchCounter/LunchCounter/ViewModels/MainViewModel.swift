//
//  MainViewModel.swift
//  LunchCounter
//
//  Created by Sam Sung on 1/14/24.
//

import SwiftUI
import Combine

final class MainViewModel: ViewModel {
    
    enum Action {
        case addFoodButtonDidTapped(FoodType)
    }
    
    fileprivate let radius = 120.0
    fileprivate let angleStep = Double.pi * 2.0 / Double(FoodType.allCases.count)
    
    @Published var toast: Toast?
    
    init() { }
    
    // MARK: - Transform
    
    func bindAction(_ action: Action) {
        switch action {
        case .addFoodButtonDidTapped(let foodType):
            self.toast = Toast(style: .success(foodType),
                               message: "\(foodType.rawValue) 식사량이 +1 되었습니다.")
        }
    }
    
    // MARK: - Helpers
    
    public func getButtonPositions(index: Int) -> Position? {
        guard index < FoodType.allCases.count else {
            print("FoodType Button index out of range")
            return nil
        }
        
        var positions: [Position] = []
        
        for index in 0 ..< FoodType.allCases.count {
            let angle = Double(index) * self.angleStep
            let xOffset = CGFloat(self.radius * cos(angle))
            let yOffset = CGFloat(self.radius * sin(angle))
            
            positions.append(Position(angle: angle,
                                      xOffSet: xOffset,
                                      yOffSet: yOffset))
        }
        return positions[index]
    }
}
