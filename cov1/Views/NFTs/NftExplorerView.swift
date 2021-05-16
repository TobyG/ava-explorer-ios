//
//  NftExplorerView.swift
//  cov1
//
//  Created by Tobias P on 07.04.21.
//

import SwiftUI
import SwiftUIRefresh

struct NftExplorerView: View {
    @ObservedObject var viewModel = NftExplorerViewModel()
    @State private var isShowing = false
    
    var body: some View {
        VStack {
            
            TitleView(title: "Collectibles", subtitle: "Avalanche C-Chain")
            if(viewModel.isLoading) {
                ProgressView()
                Spacer()
            }
            else {
                NftList
                Spacer()
            }
        }.background(Color("AvaGrayBackground")).navigationBarHidden(true).edgesIgnoringSafeArea(.top)
    }
}

private extension NftExplorerView {
    
    var NftList: some View {
        
        List {
            if(viewModel.nftItems.count == 0) {
                Text("no NFTs found.")
            }
            ForEach(0..<viewModel.nftItems.count, id: \.self) { index in
                NftItemView(addressItem: viewModel.nftItems[index])
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

struct NftExplorerView_Previews: PreviewProvider {
    static var previews: some View {
        NftExplorerView()
    }
}
