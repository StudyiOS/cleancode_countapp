//
//  CaramelMacchiato.swift
//  CountApp_Elly
//
//  Created by elly on 1/13/24.
//

import Foundation

class CaramelMacchiato: Menu {
    var id = UUID()
    private(set) var tapCount: Int = 0
    
    func title() -> String {
        return "카라멜 마키아또"
    }
    
    func icon() -> String {
        return "img_caramel_macchiato"
    }
    
    func backgroundColor() -> Int {
        return 0xfefae0
    }
    
    func addCount(_ number: Int) {
        self.tapCount += number
    }
}
