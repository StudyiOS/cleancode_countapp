//
//  GraphViewModel.swift
//  LunchCounter
//
//  Created by Sam Sung on 1/14/24.
//

import SwiftUI
import SwiftData
import Combine

class GraphViewModel: ViewModel {
    
    var dataManager: SwiftDataManager
    
    enum Action {
        case getData
    }
    
    @Published var records: [LunchRecord]
    
    init(dataManager: SwiftDataManager) {
        self.dataManager = dataManager
        self._records = Published(wrappedValue: dataManager.fetchData {
            print($0.localizedDescription)
        })
    }
    
    // MARK: - Transform
    
    func bindAction(_ action: Action) {
        switch action {
        case .getData:
            self.records = dataManager.fetchData {
                print($0.localizedDescription)
            }
        }
    }
    
    // MARK: - Helpers
    
    public func getRecordCount(with foodType: FoodType) -> Int {
        let filteredArray = records.filter { $0.foodType == foodType }
        return filteredArray.count
    }
}
