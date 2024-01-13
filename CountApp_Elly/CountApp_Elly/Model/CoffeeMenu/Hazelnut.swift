//
//  Hazelnut.swift
//  CountApp_Elly
//
//  Created by elly on 1/13/24.
//

import Foundation

class Hazelnut: Menu {
    var id = UUID()
    private(set) var tapCount: Int = 0
    
    func title() -> String {
        return String(localized: "menu_hazelnut")
    }
    
    func icon() -> String {
        return "img_hazelnut"
    }
    
    func backgroundColor() -> Int {
        return 0xccd5ae
    }
    
    func addCount(_ number: Int) {
        self.tapCount += number
    }
}
