//
//  NetworkService.swift
//  CiXOApplication
//
//  Created by Nguyen Thien on 24/02/2024.
//

import Foundation

enum NetworkError: Error {
    case notConnected
    case cancelled
    case generic(Error)
    case urlGeneration
}

protocol NetworkService {
    typealias CompletionHandler = (Result<Data?, NetworkError>) -> Void
    
    func request(endpoint: Requestable, completion: @escaping CompletionHandler) -> Cancellable?
}

final class DefaultNetworkService: NetworkService {
    
    private let networkSessionManager: NetworkSessionManager
    private var currentTask: Cancellable?
    
    init(networkSessionManager: NetworkSessionManager) {
        self.networkSessionManager = networkSessionManager
    }
    
    func request(endpoint: Requestable, completion: @escaping CompletionHandler) -> Cancellable? {
        guard let urlRequest = endpoint.urlRequest else {
            completion(.failure(.urlGeneration))
            return nil
        }
        
        currentTask?.doCancel()
        currentTask = networkSessionManager.request(urlRequest) { data, requestError in
            if let requestError {
                completion(.failure(.generic(requestError)))
            } else {
                completion(.success(data))
            }
        }
        
        return currentTask
    }
}
