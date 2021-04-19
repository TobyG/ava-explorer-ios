//
//  NftData.swift
//  cov1
//
//  Created by Tobias P on 06.04.21.
//

import Foundation

struct NftData: Decodable {
    var token_id: String
    var token_balance: String
    var token_url: String?
    var supports_erc: [String]?
    var token_price_wei: String?
    var token_quote_rate_eth: String?
    var external_data: NftExtData?
    var owner: String
}
