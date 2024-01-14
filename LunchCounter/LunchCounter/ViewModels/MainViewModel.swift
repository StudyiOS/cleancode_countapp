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
    var dataManager: SwiftDataManager
    
    private let radius = 120.0
    private let angleStep = Double.pi * 2.0 / Double(FoodType.allCases.count)
    
    enum Action {
        case addLunchRecord(FoodType)
        case resetLunchRecord(FoodType?) // nil 인 경우 모든 데이터가 초기화 되도록
    }
    
    @Published var toast: Toast?
    
    init(dataManager: SwiftDataManager) {
        self.dataManager = dataManager
    }
    
    // MARK: - Transform
    
    func bindAction(_ action: Action) {
        switch action {
        case .addLunchRecord(let foodType):
            dataManager.appendData(item: LunchRecord(foodType: foodType),
                                   inFailure: {
                setErrorToast(error: $0, foodType: foodType)
            })
            
            self.toast = Toast(style: .success(foodType),
                               message: "\(foodType.rawValue) 식사량이 +1 되었습니다.")

        case .resetLunchRecord(let foodType):
            guard let foodType = foodType else {
                self.toast = Toast(style: .warning, message: "모든 식사 데이터가 삭제 되었습니다.")
                dataManager.removeAll {
                    setErrorToast(error: $0)
                }
                return
            }
            self.toast = Toast(style: .warning,
                               message: "\(foodType.rawValue) 데이터가 삭제 되었습니다.")
            dataManager.removeData(foodType, inFailure: {
                setErrorToast(error: $0, foodType: foodType)
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
    
    private func setErrorToast(error: SwiftDataError, foodType: FoodType? = nil) {
        var errorToast: Toast
        
        switch error {
        case .fetchDataError(let error):
            errorToast = Toast(style: .error, message: "데이터를 불러오는데 오류가 발생하였습니다.\n잠시 후 다시 시도해주세요.")
        case .addDataError(let error):
            errorToast = Toast(style: .error, message: "데이터를 추가하는데 오류가 발생하였습니다.\n잠시 후 다시 시도해주세요.")
        case .deleteDataError(let error):
            guard let foodType = foodType else {
                errorToast = Toast(style: .warning, message: "모든 식사 데이터를 삭제하는데 오류가 발생하였습니다.\n잠시 후 다시 시도해주세요.")
                return
            }
            errorToast = Toast(style: .error, message: "\(foodType.rawValue)을 삭제하는데 오류가 발생하였습니다.\n잠시 후 다시 시도해주세요.")
        }
        
        self.toast = errorToast
    }
}
