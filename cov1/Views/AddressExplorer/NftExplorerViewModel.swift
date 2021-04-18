//
//  NftItemViewModel.swift
//  cov1
//
//  Created by Tobias Pechatschek on 08.04.21.
//


import Foundation
import Combine
import Resolver

class NftExplorerViewModel: ObservableObject {

    @Published var addressExplorerRepository: AddressExplorerRepository = Resolver.resolve()
    @Published var addressItems = [AddressItem]()
    @Published var nftItems = [AddressItem]()

    private var cancellables = Set<AnyCancellable>()
    
    init() {
       
        addressExplorerRepository.$addressBalanceResponse.sink(receiveValue: { value in
            self.addressItems = value.data.items
            
            self.nftItems = self.addressItems.filter { $0.nft_data != nil }

            
        }).store(in: &cancellables)
        
    }
    
}
