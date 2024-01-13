//
//  Mocha.swift
//  CountApp_Elly
//
//  Created by elly on 1/13/24.
//

import Foundation

class Mocha: Menu {
    var id = UUID()
    private(set) var tapCount: Int = 0
    
    func title() -> String {
        return "카페 모카"
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
}
