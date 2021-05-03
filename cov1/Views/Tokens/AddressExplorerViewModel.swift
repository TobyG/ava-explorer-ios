//
//  AddressExplorerViewModel.swift
//  cov1
//
//  Created by Tobias P on 03.04.21.
//

import Foundation
import Combine
import Resolver

class AddressExplorerViewModel: ObservableObject {
    
    // repository to get data
    @Published var dataRepository: DataRepository = Resolver.resolve()
    @Published var typeFilterViewModels = [ToggleElementViewModel]()
    @Published var filteredAddressItems: [AddressItem] = []
    @Published var addressItems = [AddressItem]()
    @Published var tokenItems = [AddressItem]()
    @Published var nftItems = [AddressItem]()
    @Published var isLoading: Bool = false
    
    
    private var cancellables = Set<AnyCancellable>()
    
    var numActiveFilters: Int {
        return typeFilterViewModels.filter {$0.toggleElement.isOn}.count
    }
    
    init() {
        dataRepository.$addressBalanceResponse.sink(receiveValue: { value in
            //self.addressItems =
            self.tokenItems = value.data.items
            self.nftItems = self.tokenItems.filter { $0.nft_data != nil }
            self.filteredAddressItems = self.tokenItems.filter { $0.nft_data == nil}
            self.onFilter()
            
        }).store(in: &cancellables)
        
        dataRepository.$tokenLoading.sink(receiveValue: {value in
            self.isLoading = value
        }).store(in: &cancellables)
        
        self.typeFilterViewModels = [ToggleElementViewModel(toggleElement: ToggleElement(isOn: true, text: "cryptocurrency")),
                                     ToggleElementViewModel(toggleElement: ToggleElement(isOn: false, text: "stablecoin")),
                                     ToggleElementViewModel(toggleElement: ToggleElement(isOn: false, text: "dust"))]
    }
    
    /*
     func clear() {
    
     AddressItemType.allCases.map {
     ToggleElementViewModel(toggleElement:
     ToggleElement(isOn: false, text: $0.rawValue)) }
     self.onFilter()
     }
     */
    
    func onFilter() {
        self.filteredAddressItems = tokenItems
        if numActiveFilters > 0 {
            self.filteredAddressItems = self.filteredAddressItems.filter {
                self.containsType($0.type.rawValue)
            }
        }
    }
    
    private func containsType(_ type: String) -> Bool {
        
        let types = self.typeFilterViewModels.filter {
            $0.toggleElement.isOn
        }
        for toggle in types where toggle.toggleElement.text == type {
            return true
        }
        return false
    }
    
    func onRefresh() {
        self.dataRepository.loadTokensAndNfts()
    }
    
    
}
