//
//  ApiManager.swift
//  CurrencyConvertor
//
//  Created by Purushottam Padhya on 24/1/22.
//

import Foundation

import Alamofire

class APIManager {
    
    // MARK: - Defining attributes
    
    private let sessionManager: SessionManager
    private let retrier: APIManagerRetrier
    static let networkEnviroment: NetworkEnvironment = .dev
    
    // MARK: - Public methods
    
    func call(type: EndPointType, params: Parameters? = nil, handler: @escaping (Swift.Result<(), AlertMessage>) -> Void) {
        self.sessionManager.request(type.url,
                                    method: type.httpMethod,
                                    parameters: params,
                                    encoding: type.encoding,
                                    headers: type.headers).validate().responseJSON { (data) in
                                        switch data.result {
                                        case .success(_):
                                            handler(.success(()))
                                            break
                                        case .failure(_):
                                            handler(.failure(self.parseApiError(data: data.data)))
                                            break
                                        }
        }
    }
    
    func call<T>(type: EndPointType, params: Parameters? = nil, handler: @escaping (Swift.Result<T, AlertMessage>) -> Void) where T: Codable {
        self.sessionManager.request(type.url,
                                    method: type.httpMethod,
                                    parameters: params,
                                    encoding: type.encoding,
                                    headers: type.headers).validate().responseJSON { (data) in
                                        do {
                                            guard let jsonData = data.data else {
                                                throw AlertMessage(title: "Error", body: "No data")
                                            }
                                            let result = try JSONDecoder().decode(T.self, from: jsonData)
                                            handler(.success(result))
                                            self.resetNumberOfRetries()
                                        } catch {
                                            if let error = error as? AlertMessage {
                                                return handler(.failure(error))
                                            }
                                            
                                            handler(.failure(self.parseApiError(data: data.data)))
                                        }
        }
    }
    
    // MARK: - define methods with private modifier
    
    private func resetNumberOfRetries() {
        self.retrier.numberOfRetries = 0
    }
    
    private func parseApiError(data: Data?) -> AlertMessage {
        let decoder = JSONDecoder()
        if let jsonData = data, let error = try? decoder.decode(NetworkError.self, from: jsonData) {
            return AlertMessage(title: Constants.errorAlertTitle, body: error.key ?? error.message)
        }
        return AlertMessage(title: Constants.errorAlertTitle, body: Constants.genericErrorMessage)
    }
    
    // MARK: - init session manager
    
    init(sessionManager: SessionManager, retrier: APIManagerRetrier) {
        self.sessionManager = sessionManager
        self.retrier = retrier
        self.sessionManager.retrier = self.retrier
    }
    
}
