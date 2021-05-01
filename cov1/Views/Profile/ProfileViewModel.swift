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

    @Published var dataRepository: DataRepository = Resolver.resolve()
    @Published var address: String = ""
    @Published var didSelectMainNet: Bool = true
    
    private var cancellables = Set<AnyCancellable>()

    init() {
        dataRepository.$address.sink(receiveValue: { value in
            self.address = value
           
        }).store(in: &cancellables)
        
        dataRepository.$didSelectMainNet.sink(receiveValue: { value in
            self.didSelectMainNet = value
           
        }).store(in: &cancellables)
        
    }
    
    func toggleNet(_ val: Bool) {
        dataRepository.changeNet(val)
    }
    
    func reset() {
        dataRepository.resetUser()
    }
    
}
