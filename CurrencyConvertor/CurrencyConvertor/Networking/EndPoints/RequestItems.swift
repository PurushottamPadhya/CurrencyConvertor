//
//  RequestItems.swift
//  CurrencyConvertor
//
//  Created by Purushottam Padhya on 24/1/22.
//

import Foundation

import Alamofire

// MARK: - Enums

enum NetworkEnvironment {
    case dev
    case production
    case stage
}

enum RequestItemsType {
    
    // MARK: Events
    
    case events(_: String)
    
    // MARK: data
    
    case getRates
    case PostProducts
    case fail
    
}

// MARK: - Extensions
// MARK: - EndPointType

extension RequestItemsType: EndPointType {
    
    // MARK: - Vars & Lets
    
    var baseURL: String {
        switch APIManager.networkEnviroment {
            case .dev: return "https://www.westpac.com.au/bin/getJsonRates.wbc.fx.json"
            case .production: return "https://www.westpac.com.au/bin/getJsonRates.wbc.fx.json"
            case .stage: return "https://www.westpac.com.au/bin/getJsonRates.wbc.fx.json"
        }
    }
    
    var version: String {
        return ""
    }
    // MARK: - Since we do not have base url and url end points, supplied whole url.
    var path: String {
        switch self {
        case .events(_):
            return ""
        case .getRates:
            return ""
        case .PostProducts:
            return ""
        case .fail:
            return "fail"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .PostProducts:
            return .post
        default:
            return .get
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        default:
            return ["Content-Type": "application/json",
                    "X-Requested-With": "XMLHttpRequest"]
        }
    }
    
    var url: URL {
        switch self {
        default:
            return URL(string: self.baseURL + self.path)!
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        default:
            return JSONEncoding.default
        }
    }
    
}
