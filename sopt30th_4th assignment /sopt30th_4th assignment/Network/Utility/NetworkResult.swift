//
//  NetworkResult.swift
//  sopt30th_4th assignment
//
//  Created by 최영린 on 2022/05/11.
//

enum NetworkResult<T> {
    case success(T)         // 서버 통신 성공
    case requestErr(T)      // 요청 에러가 발생
    case pathErr(T)            // 경로 에러
    case serverErr          // 서버의 내부 에러
    case networkFail        // 네트워크 연결 실패
}

