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
    
    private var cancellables = Set<AnyCancellable>()

    
    init() {
       print("init")
        addressExplorerRepository.$address.sink(receiveValue: { value in
            self.address = value
           
        }).store(in: &cancellables)
        


    }
}
