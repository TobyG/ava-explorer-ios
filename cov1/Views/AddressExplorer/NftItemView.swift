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
            
            AddressItemView(addressItem: addressItem)
            /*
             HStack {
             Text(addressItem.contract_ticker_symbol)
             .font(.caption)
             .fontWeight(.light)
             Spacer()
             Text(addressItem.type.rawValue.uppercased())
             .font(.caption)
             .fontWeight(.light)
             
             }
             Text(addressItem.contract_name)
             .font(.headline)
             .fontWeight(.bold)
             Text(addressItem.balance).font(.headline).fontWeight(.light)
             */
            
            LazyVGrid(columns: columns) {
                ForEach(0..<addressItem.nft_data!.count, id: \.self) { index in
                    
                    KFImage(URL(string: addressItem.nft_data![index].external_data!.image)).placeholder {
                        // Placeholder while downloading.
                        Image(systemName: "photo")
                            .font(.largeTitle)
                            .opacity(0.3)
                    }
                    .resizable()
                    .frame(width: 100, height: 100).cornerRadius(10)
                     
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
