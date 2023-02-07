//
//  NetworkErrors.swift
//  Weather SwiftUI
//
//  Created by AnatoliiOstapenko on 06.02.2023.
//

import Foundation

enum NetworkErrors: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case invalidTask
    case unableToComplete
}
