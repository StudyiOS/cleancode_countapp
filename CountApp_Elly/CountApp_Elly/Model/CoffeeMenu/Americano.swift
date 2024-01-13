//
//  Americano.swift
//  CountApp_Elly
//
//  Created by elly on 1/13/24.
//

import Foundation

class Americano: Menu {
    var id = UUID()
    private(set) var tapCount: Int = 0
    
    func title() -> String {
        return "아메리카노"
    }
    
    func icon() -> String {
        return "img_americano"
    }
    
    func backgroundColor() -> Int {
        return 0xd4a373
    }
    
    func addCount(_ number: Int) {
        self.tapCount += number
    }
}
