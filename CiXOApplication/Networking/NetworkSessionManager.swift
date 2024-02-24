//
//  NetworkSessionManager.swift
//  CiXOApplication
//
//  Created by Nguyen Thien on 24/02/2024.
//

import Foundation
import Alamofire

protocol NetworkSessionManager {
    typealias CompletionHandler = (Data?, Error?) -> Void
    
    func request(_ url: URLRequest, completion: @escaping CompletionHandler) -> Cancellable
}

class AFNetworkServiceManager: NetworkSessionManager {
    
    func request(_ url: URLRequest, completion: @escaping CompletionHandler) -> Cancellable {
        AF.request(url)
            .validate()
            .responseData { response in
                switch response.result {
                case let .success(data):
                    completion(data, nil)
                case let .failure(error):
                    completion(nil, error)
                }
            }
    }
}

extension DataRequest: Cancellable {
    func doCancel() {
        cancel()
    }
}
