//
//  ImageModel.swift
//  sopt30th_4th assignment
//
//  Created by 최영린 on 2022/05/14.
//

//
import Foundation

struct ImageData: Codable {
    //{"id":"0","author":"AlejandroEscamilla","width":5616,"height":3744,"url":"https://unsplash.com/photos/yC-Yzbqy7PY","download_url":"https://picsum.photos/id/0/5616/3744"}
    let id: String
    let author: String
    let width: Int
    let height: Int
    let url: String
    let download_url: String
}

typealias ImageResponse = [ImageData]
