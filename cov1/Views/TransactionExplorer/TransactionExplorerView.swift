//
//  TransactionExplorerView.swift
//  cov1
//
//  Created by Tobias P on 07.04.21.
//

import SwiftUI

struct TransactionExplorerView: View {
    @ObservedObject var viewModel = TransactionExplorerViewModel()
    
    var body: some View {
        
        NavigationView{
            VStack {
                TitleView(title: "Transactions", subtitle: "Avalanche C-Chain")
                ScrollView {
                    
                    LazyVStack {
                        /*ForEach(0..<viewModel.filteredAddressItems.count, id: \.self) { index in*/
                        ForEach(0..<viewModel.transactions.count, id: \.self) { index in
                            TransactionItemView(trans: viewModel.transactions[index])
                        }
                    }.padding().padding(.top, 0).background(Color.white).cornerRadius(30)
                    
                }
            }.background(Color("AvaGray"))
            .navigationBarHidden(true).edgesIgnoringSafeArea(.top)
            
        }
        
    }
}

struct TransactionExplorerView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionExplorerView()
    }
}
