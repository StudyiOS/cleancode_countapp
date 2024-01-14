//
//  MainViewModel.swift
//  LunchCounter
//
//  Created by Sam Sung on 1/14/24.
//

import SwiftUI
import SwiftData
import Combine

final class MainViewModel: ViewModel {
    var dataManager: DataManager
    
    enum Action {
        case addLunchRecord(FoodType)
        case resetLunchRecord(FoodType?) // nil 인 경우 모든 데이터가 초기화 되도록
    }
    
    fileprivate let radius = 120.0
    fileprivate let angleStep = Double.pi * 2.0 / Double(FoodType.allCases.count)
    
    @Published var toast: Toast?
    
    init(dataManager: DataManager) {
        self.dataManager = dataManager
    }
    
    // MARK: - Transform
    
    func bindAction(_ action: Action) {
        switch action {
        case .addLunchRecord(let foodType):
            dataManager.appendItem(item: LunchRecord(foodType: foodType),
                                   inFailure: {
                self.toast = Toast(style: .error, message: "\(foodType.rawValue)을 추가하는데 오류가 발생하였습니다.\n잠시 후 다시 시도해주세요.")
            })
            
            self.toast = Toast(style: .success(foodType),
                               message: "\(foodType.rawValue) 식사량이 +1 되었습니다.")
            
            print(dataManager.fetchItems(inFailure: {
                print("아이템 가져오기 실패")
            }).count)
        case .resetLunchRecord(let foodType):
            guard let foodType = foodType else {
                print("전체 초기화")
                self.toast = Toast(style: .warning, message: "모든 식사 데이터가 삭제 되었습니다.")
                return
            }
            self.toast = Toast(style: .warning,
                               message: "\(foodType.rawValue) 데이터가 삭제 되었습니다.")
            dataManager.removeItem(foodType, inFailure: {
                self.toast = Toast(style: .error, message: "\(foodType.rawValue) 데이터를 삭제 하는데 실패였습니다.\n잠시 후 다시 시도해주세요.")
            })
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
