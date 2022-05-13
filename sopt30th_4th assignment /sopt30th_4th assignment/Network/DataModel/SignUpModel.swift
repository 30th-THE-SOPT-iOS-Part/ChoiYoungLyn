//
//  SignUpModel.swift
//  sopt30th_4th assignment
//
//  Created by 최영린 on 2022/05/13.
//

import Foundation

struct SignUpResponse: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: SingUpData?
}

struct SingUpData: Codable {
    let id: Int
}
