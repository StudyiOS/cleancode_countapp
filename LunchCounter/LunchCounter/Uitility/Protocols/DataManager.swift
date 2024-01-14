//
//  DataManager.swift
//  LunchCounter
//
//  Created by Sam Sung on 1/14/24.
//

import Foundation

protocol DataManager {
    associatedtype Item
    associatedtype DataError: Error
    
    func fetchData(inFailure: (DataError) -> Void) -> [Item]
    
    func appendData(item: Item, inFailure: (DataError) -> Void)
}
