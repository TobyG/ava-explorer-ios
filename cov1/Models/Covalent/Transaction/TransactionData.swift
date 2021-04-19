//
//  TransactionData.swift
//  cov1
//
//  Created by Tobias P on 08.04.21.
//

import Foundation

struct TransactionData: Decodable {
    
    var address: String
    var updated_at: String
    var next_update_at: String
    var quote_currency: String
    var chain_id: Int
    var items: [Transaction]
}
