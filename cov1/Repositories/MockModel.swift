//
//  MockModel.swift
//  cov1
//
//  Created by Tobias Pechatschek on 03.04.21.
//

import Foundation

public class MockModel {

    var addressItems: [AddressItem]

    public init() {

        self.addressItems = [
            AddressItem(contract_decimals: 6, contract_name: "Tether USDT", contract_ticker_symbol: "USDT", contract_address: "0xdac17f958d2ee523a2206206994597c13d831ec7", supports_erc: ["erc20"], logo_url: "https://logos.covalenthq.com/tokens/0xdac17f958d2ee523a2206206994597c13d831ec7.png", type: AddressItemType.cryptocurrency, balance: "393848227", quote_rate: 0.9985799, quote: 784815.6),

            AddressItem(contract_decimals: 6, contract_name: "NEEO", contract_ticker_symbol: "NEEO", contract_address: "0xd8446236fa95b9b5f9fd0f8e7df1a944823c683d", supports_erc: ["erc20"], logo_url: "https://logos.covalenthq.com/tokens/0xd8446236fa95b9b5f9fd0f8e7df1a944823c683d.png", type: AddressItemType.stablecoin, balance: "393848227", quote_rate: 0.9985799, quote: 784815.6)
        ]
            }
}
