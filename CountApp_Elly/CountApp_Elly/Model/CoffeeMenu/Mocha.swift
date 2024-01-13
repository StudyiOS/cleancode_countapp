//
//  Mocha.swift
//  CountApp_Elly
//
//  Created by elly on 1/13/24.
//

import Foundation

class Mocha: CoffeeMenu {
    var id = UUID()
    private(set) var tapCount: Int = 0
    
    func title() -> String {
        return String(localized: "menu_mocha")
    }
    
    func icon() -> String {
        return "img_mocha"
    }
    
    func backgroundColor() -> Int {
        return 0xe9edc9
    }
    
    func addCount(_ number: Int) {
        self.tapCount += number
    }
    
    func resetCount() {
        self.tapCount = 0
    }
}
