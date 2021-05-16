//
//  AddressItemView.swift
//  cov1
//
//  Created by Tobias P on 03.04.21.
//

import SwiftUI
import struct Kingfisher.KFImage

struct TokenItemView: View {
    
    var addressItem: AddressItem
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                
                TokenImage(url: addressItem.logo_url)
                
                VStack(alignment: .leading) {
                    
                     HStack {
                        Text(addressItem.contract_ticker_symbol)
                            .smallText().foregroundColor(.gray)
                        Spacer()
                        Text(addressItem.type.rawValue)
                            .smallText()
                            .foregroundColor(.gray)
                    }
                     
                    
                    Text(addressItem.contract_name)
                        .mediumTextReg().foregroundColor(Color("AvaPurple"))
                    Text("\(addressItem.balanceComma, specifier: "%.4f")").mediumText().foregroundColor(Color("AvaPurple"))
                    Text("$\(addressItem.quote, specifier: "%.2f")").mediumText().foregroundColor(Color("AvaPurple"))

                }
            }
        }
        
    }
}

struct AddressItemView_Previews: PreviewProvider {
    static var previews: some View {
        TokenItemView(addressItem: AddressItem(contract_decimals: 6, contract_name: "Tether USDT", contract_ticker_symbol: "USDT", contract_address: "0xdac17f958d2ee523a2206206994597c13d831ec7", supports_erc: ["erc20"], logo_url: "https://logos.covalenthq.com/tokens/0xdac17f958d2ee523a2206206994597c13d831ec7.png", type: AddressItemType.cryptocurrency, balance: "393848227", quote_rate: 0.9985799, quote: 784815.6))
    }
}
