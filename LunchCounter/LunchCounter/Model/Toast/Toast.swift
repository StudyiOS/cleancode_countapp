//
//  ToastMessage.swift
//  LunchCounter
//
//  Created by Sam Sung on 1/14/24.
//

import Foundation

struct Toast: Equatable {
    var style: ToastStyle
    var message: String
    var duration: Double = 2
    var width: Double = .infinity
}

