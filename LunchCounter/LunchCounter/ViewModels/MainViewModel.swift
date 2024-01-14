//
//  MainViewModel.swift
//  LunchCounter
//
//  Created by Sam Sung on 1/14/24.
//

import SwiftUI
import Combine

final class MainViewModel: ViewModel {
    var state: State
    
    enum Action {
        case addFoodButtonDidTapped(FoodType)
    }
    
    struct State {
        fileprivate let radius = 120.0 // Your desired circle radius, in points
        fileprivate let angleStep = Double.pi * 2.0 / Double(FoodType.allCases.count)
    }
    
    init() {
        self.state = State()
    }
    
    // MARK: - Transform
    
    func bindAction(_ action: Action) {
        switch action {
        case .addFoodButtonDidTapped(let foodType):
            print("\(foodType) Did Tapped!")
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
            let angle = Double(index) * self.state.angleStep
            let xOffset = CGFloat(self.state.radius * cos(angle))
            let yOffset = CGFloat(self.state.radius * sin(angle))
            // add button to superview with center anchored to center of superview
            // offset by xOffset and yOffset
            positions.append(Position(angle: angle,
                                      xOffSet: xOffset,
                                      yOffSet: yOffset))
        }
        return positions[index]
    }
}
