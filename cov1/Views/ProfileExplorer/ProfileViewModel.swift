//
//  ProfileViewModel.swift
//  cov1
//
//  Created by Tobias P on 18.04.21.
//

import Foundation
import Resolver
import Combine

class ProfileViewModel: ObservableObject {

    @Published var addressExplorerRepository: AddressExplorerRepository = Resolver.resolve()
    @Published var address: String = ""
    @Published var didSelectMainNet: Bool = true
    
    private var cancellables = Set<AnyCancellable>()

    init() {
        addressExplorerRepository.$address.sink(receiveValue: { value in
            self.address = value
           
        }).store(in: &cancellables)
        
        addressExplorerRepository.$didSelectMainNet.sink(receiveValue: { value in
            self.didSelectMainNet = value
           
        }).store(in: &cancellables)
        
    }
    
    func toggleNet(_ val: Bool) {
        addressExplorerRepository.changeNet(val)
    }
    
}
