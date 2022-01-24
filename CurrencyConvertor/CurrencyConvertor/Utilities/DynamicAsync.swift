//
//  DynamicAsync.swift
//  CurrencyConvertor
//
//  Created by Purushottam Padhya on 24/1/22.
//

import Foundation

class DynamicAsync<T>: Dynamic<T> {
    
    // MARK: - Ovverides
    
    override func fire() {
        -->{ self.listener?(self.value) }
    }
    
    // MARK: - Initialization
    
    override init(_ v: T) {
        super.init(v)
    }
}
