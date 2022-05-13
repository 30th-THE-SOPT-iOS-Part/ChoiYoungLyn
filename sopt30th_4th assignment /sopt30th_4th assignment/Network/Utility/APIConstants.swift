//
//  APIConstants.swift
//  sopt30th_4th assignment
//
//  Created by 최영린 on 2022/05/11.
//

import Foundation

struct APIConstants {
    // MARK: - Base URL
    static let baseURL = "http://13.124.62.236"
    
    // MARK: - Feature URL
    static let loginURL = baseURL + "/auth/signin"
    static let signUpURL = baseURL + "/auth/signup"
}
