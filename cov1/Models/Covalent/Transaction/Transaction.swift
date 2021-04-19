//
//  Transaction.swift
//  cov1
//
//  Created by Tobias P on 08.04.21.
//

import Foundation

struct Transaction: Decodable {
    
    var block_signed_at: String
    var tx_hash: String
    var tx_offset: Int
    var successful: Bool
    var from_address: String
    //var from_address_label
    var to_address: String
    var value: String
    var value_quote: Double?
    var gas_offered: Int
    var gas_spent: Int
    var gas_price: Int
    var gas_quote: Double?
    var gas_quote_range: Double?
    
}
