//
//  UserService.swift
//  sopt30th_4th assignment
//
//  Created by 최영린 on 2022/05/11.
//

import Foundation
import Alamofire

/*
 서비스 코드
 
 - Request
    ㄴ 요청서를 작성하기 위한 준비물을 준비하고
    ㄴ 그것들을 적절하게 사용해서 서버에게 요청을 하게 됩니다.
 - Response
 */

class UserService {
    // 싱글톤 변수(Singleton) : 어디서든 사용할 수 있도록 하는 객체, 한번만 메모리 할당 후 곳곳에서 사용함 / 인스턴스를 딱 하나만 만들어놓고 사용하고 싶을 때 만듬!
    //
    static let shared = UserService()
    
    private init() {}
    
    func login(email: String,
               password: String,
               completion: @escaping (NetworkResult<Any>) -> Void)
    {
        
        let url = APIConstants.loginURL
        let header: HTTPHeaders = ["Content-Type" : "application/json"]
        let body: Parameters = [
            "email": email,
            "password": password
        ]
        
        let dataRequest = AF.request(url,
                                    method: .post,
                                    parameters: body,
                                    encoding: JSONEncoding.default,
                                    headers: header)
        
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                let networkResult = self.judgeStatus(by: statusCode, value, type: LoginResponse.self)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    func signUp(name: String,
               email: String,
               password: String,
               completion: @escaping (NetworkResult<Any>) -> Void)
    {
        
        let url = APIConstants.signUpURL
        let header: HTTPHeaders = ["Content-Type" : "application/json"]
        let body: Parameters = [
            "name": name,
            "email": email,
            "password": password
        ]
   
        let dataRequest = AF.request(url,
                                    method: .post,
                                    parameters: body,
                                    encoding: JSONEncoding.default,
                                    headers: header)
        
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                
                let networkResult = self.judgeStatus(by: statusCode, value, type: SignUpResponse.self)
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
