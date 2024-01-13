//
//  Item.swift
//  LunchCounter
//
//  Created by Sam Sung on 1/13/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
