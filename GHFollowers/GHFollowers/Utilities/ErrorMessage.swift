//
//  ErrorMessage.swift
//  GHFollowers
//
//  Created by David on 6.2.25..
//

import Foundation


enum ErrorMessage : String {
    case invalidUsername =  "Invalid request with provided username!"
    case unableToComplete = "Unable to complete the request. Check internet connection!"
    case invalidResponse = "Invalid response upon the request!"
    case invalidDataReceived = "Invalid data received!"
    case invalidDecoding = "Decoding of received data failed!"
}
