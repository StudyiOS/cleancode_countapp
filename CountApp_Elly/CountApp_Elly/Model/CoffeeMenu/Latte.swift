//
//  Latte.swift
//  CountApp_Elly
//
//  Created by elly on 1/13/24.
//

import Foundation

class Latte: Menu {
    var id = UUID()
    private(set) var tapCount: Int = 0
    
    func title() -> String {
        return "라떼"
    }
    
    func icon() -> String {
        return "img_latte"
    }
    
    func backgroundColor() -> Int {
        return 0xfaedcd
    }
    
    func addCount(_ number: Int) {
        self.tapCount += number
    }
}
