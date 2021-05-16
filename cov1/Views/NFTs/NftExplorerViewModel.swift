//
//  NftItemViewModel.swift
//  cov1
//
//  Created by Tobias P on 08.04.21.
//


import Foundation
import Combine
import Resolver

class NftExplorerViewModel: ObservableObject {

    @Published var dataRepository: DataRepository = Resolver.resolve()
    @Published var addressItems = [AddressItem]()
    @Published var nftItems = [AddressItem]()
    @Published var isLoading: Bool = false
    private var cancellables = Set<AnyCancellable>()
    
    init() {
       
        dataRepository.$addressBalanceResponse.sink(receiveValue: { value in
            self.addressItems = value.data.items
            self.nftItems = self.addressItems.filter { $0.nft_data != nil }
        }).store(in: &cancellables)
        
        dataRepository.$tokenLoading.assign(to: \.isLoading, on: self).store(in: &cancellables)
    }
    
    func onRefresh() {
        self.dataRepository.loadTokensAndNfts()
    }
    
}
