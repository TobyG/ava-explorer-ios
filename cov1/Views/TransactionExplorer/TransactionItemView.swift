//
//  TransactionItemView.swift
//  cov1
//
//  Created by Tobias P on 08.04.21.
//

import SwiftUI

struct TransactionItemView: View {
    
    var trans: Transaction
    var address: String
    var body: some View {
        VStack {
            HStack {
                                
                TransIcon.padding(.trailing)
                VStack(alignment: .leading) {
                    Text(trans.value)
                        .mediumTextReg().foregroundColor(Color("AvaPurple"))
                    Text(trans.from_address)
                        .smallText().foregroundColor(Color("AvaPurple"))
                    Text(trans.block_signed_at)
                    .smallText().foregroundColor(.gray)
                }
                
            }.padding(.top)
            Divider().padding(.top)
        }
        
    }
}

private extension TransactionItemView {
    var TransIcon: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 6)
                .fill(address == trans.from_address ? Color("AvaRed") : Color("AvaPurple"))
                            .frame(width: 30, height: 30)
            Image(systemName: address == trans.from_address ? "arrow.up.right" : "arrow.down.left").foregroundColor(.white).font(.system(size: 15))
        }
    }
}

struct TransactionItemView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionItemView(trans: Transaction(block_signed_at: "2021-04-05T19:24:08", tx_hash: "0xd2b296519d9af3ec46544d21e62c54f2304b8951db63d73f08f651fb75b7ed37", tx_offset: 0, successful: true, from_address: "0x1f351b1caf0b7037353cd284a6a225cecce5677b", to_address: "0x5a9710f3f23053573301c2ab5024d0a43a461e80", value: "0", value_quote: 0.0, gas_offered: 227404, gas_spent: 150117, gas_price: 225000000, gas_quote: 70.0328, gas_quote_range: 2100.2368), address: "0xabc")
    }
}
