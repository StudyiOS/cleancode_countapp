//
//  Menu.swift
//  CountApp_Elly
//
//  Created by elly on 1/13/24.
//

import Foundation

protocol CoffeeMenu: Identifiable {
    var id: UUID { get }
    var tapCount: Int { get }
    func title() -> String
    func icon() -> String
    func backgroundColor() -> Int
    func addCount(_ number: Int)
    func resetCount()
}
