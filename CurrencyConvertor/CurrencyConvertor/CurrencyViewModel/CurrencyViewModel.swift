//
//  CurrencyViewModel.swift
//  CurrencyConvertor
//
//  Created by Purushottam Padhya on 24/1/22.
//

import Foundation
import Alamofire
protocol CurrencyViewModelProtocol {
    var alertMessage: Dynamic<AlertMessage> { get set }
    var isLoaderHidden: Dynamic<Bool> { get set }
    var user: Dynamic<CurrencyModel.CurrencyRate?> { get set }
    
    func getRates()
    func failTest()
}

class APIDemoViewModel: NSObject, CurrencyViewModelProtocol {
    
    // MARK: - APIDemoViewModelProtocol
    
    var alertMessage: Dynamic<AlertMessage> = Dynamic(AlertMessage(title: "", body: ""))
    var isLoaderHidden: Dynamic<Bool> = Dynamic(true)
    var user: Dynamic<CurrencyModel.CurrencyRate?> = Dynamic(nil)
    
    // MARK: - Vars & Lets
    
    private let apiManager = APIManager(sessionManager: SessionManager(), retrier: APIManagerRetrier())
    
    // MARK: - Public methods
    
    func getRates() {
        self.isLoaderHidden.value = false
        self.apiManager.call(type: RequestItemsType.getRates) { (res: Swift.Result<CurrencyModel.CurrencyRate, AlertMessage>) in
            self.isLoaderHidden.value = true
            switch res {
            case .success(let user):
                self.user.value = user
                break
            case .failure(let message):
                self.alertMessage.value = message
                break
            }
        }
    }
    
    func failTest() {
        self.isLoaderHidden.value = false
        self.apiManager.call(type: RequestItemsType.fail) { (res: Swift.Result<CurrencyModel.CurrencyRate, AlertMessage>) in
            self.isLoaderHidden.value = true
            switch res {
            case .success(let user):
                self.user.value = user
                break
            case .failure(let message):
                self.alertMessage.value = message
                break
            }
        }
        
    }
    
    // MARK: - Init
    
    override init() {
        super.init()
    }
    
}
