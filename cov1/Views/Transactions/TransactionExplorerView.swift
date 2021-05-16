//
//  TransactionExplorerView.swift
//  cov1
//
//  Created by Tobias P on 07.04.21.
//

import SwiftUI
import SwiftUIRefresh

struct TransactionExplorerView: View {
    @ObservedObject var viewModel = TransactionExplorerViewModel()
    @State private var isShowing = false
    
    var body: some View {
        
        NavigationView{
            VStack {
                TitleView(title: "Transactions", subtitle: "Avalanche C-Chain")
                TransactionList
            }.background(Color("AvaGrayBackground"))
            .navigationBarHidden(true).edgesIgnoringSafeArea(.top)
            
        }
        
    }
}

private extension TransactionExplorerView {
    var TransactionList : some View {
        List {
            ForEach(0..<viewModel.transactions.count, id: \.self) { index in
                TransactionItemView(trans: viewModel.transactions[index], address: viewModel.address)
            }.listRowBackground(Color("ListBackground"))
        }.listStyle(InsetListStyle()).pullToRefresh(isShowing: $isShowing) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.isShowing = false
                self.viewModel.onRefresh()
            }
        }
        .onChange(of: self.isShowing) { value in
        }
    }
}

struct TransactionExplorerView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionExplorerView()
    }
}
