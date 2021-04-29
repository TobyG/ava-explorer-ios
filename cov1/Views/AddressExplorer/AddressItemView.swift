//
//  AddressItemView.swift
//  cov1
//
//  Created by Tobias P on 03.04.21.
//

import SwiftUI
import struct Kingfisher.KFImage

struct AddressItemView: View {
    
    var addressItem: AddressItem
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                // image
                
                AddressItemImage(url: addressItem.logo_url)
                
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
                    Text("\(addressItem.balanceComma)").mediumText().foregroundColor(Color("AvaPurple"))
                    Text("$ \(addressItem.quote)").mediumText().foregroundColor(Color("AvaPurple"))

                }.padding(.top, 8).padding(.bottom, 8)
            }
            Divider()

        }
        
    }
    
    func getColor() -> Color {
        switch self.addressItem.type {
        case AddressItemType.cryptocurrency:
            return Color.blue

        case AddressItemType.stablecoin:
            return Color.green
        case AddressItemType.nft:
            return Color.yellow
        case AddressItemType.dust:
            return Color.gray
        default:
            return Color.purple
        }
    }
}

struct AddressItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddressItemView(addressItem: AddressItem(contract_decimals: 6, contract_name: "Tether USDT", contract_ticker_symbol: "USDT", contract_address: "0xdac17f958d2ee523a2206206994597c13d831ec7", supports_erc: ["erc20"], logo_url: "https://logos.covalenthq.com/tokens/0xdac17f958d2ee523a2206206994597c13d831ec7.png", type: AddressItemType.cryptocurrency, balance: "393848227", quote_rate: 0.9985799, quote: 784815.6))
    }
}
