//
//  ViewModel.swift
//  LunchCounter
//
//  Created by Sam Sung on 1/14/24.
//

import Foundation
import Combine

protocol ViewModel: ObservableObject {
    associatedtype Action
    
    func bindAction(_ action: Action)
}
