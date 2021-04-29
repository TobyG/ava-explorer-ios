//
//  TransactionItemView.swift
//  cov1
//
//  Created by Tobias P on 08.04.21.
//

import SwiftUI

struct TransactionItemView: View {
    
    var trans: Transaction
    var body: some View {
        HStack {
            
            TransIcon
            VStack(alignment: .leading) {
                Text(trans.from_address)
                    .font(.headline).foregroundColor(Color("AvaPurple"))
                Text(trans.block_signed_at)
                    .font(.caption).foregroundColor(.gray)
            }
            Text(trans.value)
                .font(.headline)
        }
    }
}

private extension TransactionItemView {
    var TransIcon: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(Color(hue: 0.031, saturation: 0.273, brightness: 0.931))
                            .frame(width: 60, height: 60)
            Image(systemName: "arrow.up.right").foregroundColor(.white).font(.system(size: 20))
        }
    }
}

struct TransactionItemView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionItemView(trans: Transaction(block_signed_at: "2021-04-05T19:24:08", tx_hash: "0xd2b296519d9af3ec46544d21e62c54f2304b8951db63d73f08f651fb75b7ed37", tx_offset: 0, successful: true, from_address: "0x1f351b1caf0b7037353cd284a6a225cecce5677b", to_address: "0x5a9710f3f23053573301c2ab5024d0a43a461e80", value: "0", value_quote: 0.0, gas_offered: 227404, gas_spent: 150117, gas_price: 225000000, gas_quote: 70.0328, gas_quote_range: 2100.2368))
    }
}
