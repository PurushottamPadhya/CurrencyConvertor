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
    var rates: Dynamic<CurrencyModel.CurrencyRate?> { get set }
    
    func getRates()
    func failTest()
}

class APICurrencyViewModel: NSObject, CurrencyViewModelProtocol {
    
    // MARK: - APIDemoViewModelProtocol
    
    var alertMessage: Dynamic<AlertMessage> = Dynamic(AlertMessage(title: "", body: ""))
    var isLoaderHidden: Dynamic<Bool> = Dynamic(true)
    var rates: Dynamic<CurrencyModel.CurrencyRate?> = Dynamic(nil)
    
    
    // MARK: - Vars & Lets
    
    private let apiManager = APIManager(sessionManager: SessionManager(), retrier: APIManagerRetrier())
    
    // MARK: - Public methods
    
    func getRates() {
        self.isLoaderHidden.value = false
        self.apiManager.call(type: RequestItemsType.getRates) { (res: Swift.Result<CurrencyModel.CurrencyRate, AlertMessage>) in
            self.isLoaderHidden.value = true
            switch res {
            case .success(let rate):
                self.rates.value = rate
//                self.products.value = rate.data.brands.wbc.portfolios.fx.products
//                self.productList = rate.data.brands.wbc.portfolios.fx.products

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
            case .success(let rate):
                self.rates.value = rate
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
