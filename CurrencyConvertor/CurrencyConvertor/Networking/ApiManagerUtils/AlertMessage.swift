//
//  AlertMessage.swift
//  CurrencyConvertor
//
//  Created by Purushottam Padhya on 24/1/22.
//

import Foundation

class AlertMessage: Error {
    
    // MARK: - Vars & Lets
    
    var title = ""
    var body = ""
    
    // MARK: - Intialization
    
    init(title: String, body: String) {
        self.title = title
        self.body = body
    }
    
}
