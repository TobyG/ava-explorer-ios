//
//  AddressBalance.swift
//  cov1
//
//  Created by Tobias Pechatschek on 03.04.21.
//

import Foundation

struct AddressBalance: Decodable {
    var address: String
    var updated_at: String
    var next_update_at: String
    var quote_currency: String
    var chain_id: Int
    var items: [AddressItem]
}
