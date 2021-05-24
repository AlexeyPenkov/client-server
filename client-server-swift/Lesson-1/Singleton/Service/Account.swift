//
//  File.swift
//  client-server-swift
//
//  Created by Алексей Пеньков on 24.05.2021.
//

import Foundation

class AccountService {
    
    private init () {}
    
    static let shared = AccountService()
    
    var name: String = ""
    var cash: Int = 0
}
