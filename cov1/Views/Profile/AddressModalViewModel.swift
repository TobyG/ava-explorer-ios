//
//  AddressModalViewModel.swift
//  cov1
//
//  Created by Tobias P on 18.04.21.
//

import Foundation
import Resolver
import Combine

class AddressModalViewModel: ObservableObject {

    @Published var addressExplorerRepository: DataRepository = Resolver.resolve()

    @Published var address: String = ""
    
    private var cancellables = Set<AnyCancellable>()

    
    init() {
        addressExplorerRepository.$address.assign(to: \.address, on: self).store(in: &cancellables)
    }
    
    func updateAddress() {
        self.addressExplorerRepository.changeAddress(address: self.address)
    }
}
