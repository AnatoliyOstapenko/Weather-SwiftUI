//
//  AlertModel.swift
//  Weather SwiftUI
//
//  Created by AnatoliiOstapenko on 07.02.2023.
//

import SwiftUI

struct AlertModel: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button?
}

struct AlertMock {
    static let invalidURL = AlertModel(title: Text("Invalid URL"),
                                      message: Text("It seems that URL adress appears to be invalid"),
                                      dismissButton: .default(Text("OK")))
    
    static let invalidResponse = AlertModel(title: Text("Invalid Response"),
                                           message: Text("It seems that response appears to be invalid, check response status code"),
                                           dismissButton: .default(Text("OK")))
    static let invalidData = AlertModel(title: Text("Invalid Data"),
                                       message: Text("It seems that data appears to be invalid"),
                                       dismissButton: .default(Text("OK")))
    
    static let invalidTask = AlertModel(title: Text("Invalid Task"),
                                       message: Text("URL Session unable to complete, check internet connection"),
                                       dismissButton: .default(Text("OK")))
    
    static let unableToComplete = AlertModel(title: Text("Unable To Complete"),
                                            message: Text("Check the menu model, there is a grammatical error"),
                                            dismissButton: .default(Text("OK")))
}
