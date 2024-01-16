//
//  Bindable.swift
//  CountApp
//
//  Created by 황홍필 on 2024/01/13.
//

import Foundation
import ReactorKit

protocol Bindable {
    associatedtype Reactor: ReactorKit.Reactor
    func bindState(_ reactor: Reactor)
    func bindAction(_ reactor: Reactor)
}
