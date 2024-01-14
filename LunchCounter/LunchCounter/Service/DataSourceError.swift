//
//  DataSourceError.swift
//  LunchCounter
//
//  Created by Sam Sung on 1/14/24.
//

import Foundation

enum DataSourceError: Error {
    case fetchDataError(Error)
    case addDataError(Error)
    case deleteDataError(Error)
}
