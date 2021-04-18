//
//  AddressItem.swift
//  cov1
//
//  Created by Tobias Pechatschek on 03.04.21.
//

import Foundation


struct AddressItem: Decodable {
    
    var contract_decimals: Int
    var contract_name: String
    var contract_ticker_symbol: String
    var contract_address: String
    var supports_erc: [String]?
    var logo_url: String
    var type: AddressItemType
    var balance: String
    var quote_rate: Float?
    var quote: Float
    var nft_data: [NftData]?
    
    var balanceComma: String {
        //let bal: Double = (balance as NSString).doubleValue
        //let po: Double = Double(pow(10, contract_decimals))
        var bal = balance
        //bal.insert(".", at: balance.index(0, offsetBy: (balance.count - contract_decimals)))
        return bal
    }
}
