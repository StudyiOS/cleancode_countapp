//
//  DataManager.swift
//  LunchCounter
//
//  Created by Sam Sung on 1/14/24.
//

import SwiftUI
import SwiftData

final class SwiftDataManager: DataManager {
    typealias Item = LunchRecord
    typealias DataError = SwiftDataError
    
    private let modelContainer: ModelContainer
    private let modelContext: ModelContext

    @MainActor
    static let shared = SwiftDataManager()

    @MainActor
    private init() {
        self.modelContainer = try! ModelContainer(for: LunchRecord.self)
        self.modelContext = modelContainer.mainContext
    }

    func appendData(item: LunchRecord, inFailure: (SwiftDataError) -> Void) {
        modelContext.insert(item)
        do {
            try modelContext.save()
        } catch {
            inFailure(.addDataError(error))
        }
    }

    func fetchData(inFailure: (SwiftDataError) -> Void) -> [LunchRecord] {
        do {
            return try modelContext.fetch(FetchDescriptor<LunchRecord>())
        } catch {
            inFailure(.fetchDataError(error))
            return []
        }
    }
    
    func removeData(_ type: FoodType, inFailure: (SwiftDataError) -> Void) {
        do {
            try modelContext.delete(model: LunchRecord.self, where: #Predicate { lunch in
                lunch.foodType == type
            })
        } catch {
            inFailure(.deleteDataError(error))
        }
    }
    
    func removeAll(inFailure: (SwiftDataError) -> Void) {
        do {
            try modelContext.delete(model: LunchRecord.self)
        } catch {
            inFailure(.deleteDataError(error))
        }
    }
}
