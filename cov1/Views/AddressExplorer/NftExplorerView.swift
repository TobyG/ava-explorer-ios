//
//  NftExplorerView.swift
//  cov1
//
//  Created by Tobias Pechatschek on 07.04.21.
//

import SwiftUI

struct NftExplorerView: View {
    @ObservedObject var viewModel = AddressExplorerViewModel()
    
    var body: some View {
        VStack {
            
            TitleView(title: "Collectibles", subtitle: "Avalanche C-Chain")
            ScrollView {
                NftList
            }
        }.background(Color("AvaGray")).edgesIgnoringSafeArea(.top)
    }
}

private extension NftExplorerView {
    
    var NftList: some View {
        LazyVStack {
            /*ForEach(0..<viewModel.filteredAddressItems.count, id: \.self) { index in*/
            ForEach(0..<viewModel.nftItems.count, id: \.self) { index in
                NftItemView(addressItem: viewModel.nftItems[index])
            }
        }.padding().padding(.top, 0).background(Color.white).cornerRadius(30)
    }
    
}

struct NftExplorerView_Previews: PreviewProvider {
    static var previews: some View {
        NftExplorerView()
    }
}
