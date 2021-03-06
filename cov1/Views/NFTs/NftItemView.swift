//
//  NftItemView.swift
//  cov1
//
//  Created by Tobias P on 06.04.21.
//

import SwiftUI
import struct Kingfisher.KFImage

struct NftItemView: View {
    
    var addressItem: AddressItem
    var columns: [GridItem] =
        Array(repeating: .init(.flexible()), count: 3)
    var body: some View {
        
        VStack(alignment: .leading) {
            
            VStack(alignment: .leading) {
                Text(addressItem.contract_ticker_symbol)
                    .smallText().foregroundColor(.gray)
                
                Text(addressItem.contract_name)
                    .mediumTextReg().foregroundColor(Color("AvaPurple"))
            }
            
            LazyVGrid(columns: columns) {
                ForEach(0..<addressItem.nft_data!.count, id: \.self) { index in
                    if(addressItem.nft_data![index].external_data != nil) {
                        KFImage(URL(string: addressItem.nft_data![index].external_data!.image)).placeholder {
                            // Placeholder while downloading.
                            ProgressView()
                        }
                        .resizable()
                        .frame(width: 90, height: 90).cornerRadius(6)
                    }
                }
            }.padding()
        }
        
    }
}

struct NftItemView_Previews: PreviewProvider {
    static var previews: some View {
        NftItemView(addressItem: AddressItem(contract_decimals: 6, contract_name: "Avaxtars", contract_ticker_symbol: "AVXT", contract_address: "0xdac17f958d2ee523a2206206994597c13d831ec7", supports_erc: ["erc20"], logo_url: "https://logos.covalenthq.com/tokens/0xdac17f958d2ee523a2206206994597c13d831ec7.png", type: AddressItemType.nft, balance: "11", quote_rate: 0.0, quote: 0.0, nft_data: [NftData(token_id: "2514", token_balance: "1", token_url: "", supports_erc: ["erc20"], token_price_wei: "", token_quote_rate_eth: "", external_data: NftExtData(name: "Colby Schiller IV", description: "", image: "https://ipfs.infura.io/ipfs/QmR7y73zaW5PQ6RPjvcYDJmnWDaqfvBK33qWzCyyMdRKXo", external_url: "http://www.cryptoseals.art/seal/2514", owner: ""), owner: "0x1f351b1caf0b7037353cd284a6a225cecce5677b")]))
    }
}
