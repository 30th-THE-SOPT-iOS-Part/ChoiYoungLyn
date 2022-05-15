//
//  ImageService.swift
//  sopt30th_4th assignment
//
//  Created by 최영린 on 2022/05/14.
//

import Foundation
import Alamofire

class ImageService{
    static let shared = ImageService()

    private init() {}

    func loadRandomImage(completion: @escaping (NetworkResult<Any>) -> Void)
    {
        let url = APIConstants.imageURL
        let header: HTTPHeaders = ["Content-Type" : "application/json"]
        let body: Parameters = ["page": 1, "limit": 4]
        
        let dataRequest = AF.request(url,
                                    method: .get,
                                    parameters: body,
                                     encoding: URLEncoding.queryString,
                                    headers: header)
        
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                let networkResult = self.judgeStatus(by: statusCode, value, type: ImageResponse.self)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    private func judgeStatus<T:Codable> (by statusCode: Int, _ data: Data, type: T.Type) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(type.self, from: data)
        else { return .pathErr(data) }
        
        switch statusCode {
        case 200 ..< 300: return .success(decodedData as Any)
        case 400 ..< 500: return .pathErr(decodedData)
        case 500: return .serverErr
        default: return .networkFail
        }
    }
}
