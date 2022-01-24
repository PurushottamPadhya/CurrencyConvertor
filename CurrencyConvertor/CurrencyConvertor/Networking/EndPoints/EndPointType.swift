//
//  EndPointType.swift
//  CurrencyConvertor
//
//  Created by Purushottam Padhya on 24/1/22.
//

import Foundation
import Alamofire
// MARK: - define end points values
protocol EndPointType {
    
    var baseURL: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var url: URL { get }
    var encoding: ParameterEncoding { get }
    var version: String { get }
    
}
