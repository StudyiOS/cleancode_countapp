//
//  DataManager.swift
//  LunchCounter
//
//  Created by Sam Sung on 1/14/24.
//

import SwiftUI
import SwiftData

final class DataManager {
    private let modelContainer: ModelContainer
    private let modelContext: ModelContext

    @MainActor
    static let shared = DataManager()

    @MainActor
    private init() {
        self.modelContainer = try! ModelContainer(for: LunchRecord.self)
        self.modelContext = modelContainer.mainContext
    }

    func appendItem(item: LunchRecord, inFailure: (DataSourceError) -> Void) {
        modelContext.insert(item)
        do {
            try modelContext.save()
        } catch {
            inFailure(.addDataError(error))
        }
    }

    func fetchItems(inFailure: (DataSourceError) -> Void) -> [LunchRecord] {
        do {
            return try modelContext.fetch(FetchDescriptor<LunchRecord>())
        } catch {
            inFailure(.fetchDataError(error))
            return []
        }
    }
    
    func removeItem(_ type: FoodType, inFailure: (DataSourceError) -> Void) {
        do {
            try modelContext.delete(model: LunchRecord.self, where: #Predicate { lunch in
                lunch.foodType == type
            })
        } catch {
            inFailure(.deleteDataError(error))
        }
    }
    
    func removeAll(inFailure: (DataSourceError) -> Void) {
        do {
            try modelContext.delete(model: LunchRecord.self)
        } catch {
            inFailure(.deleteDataError(error))
        }
    }
}
