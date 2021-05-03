//
//  WelcomeViewModel.swift
//  cov1
//
//  Created by Tobias P on 30.04.21.
//

import Foundation
import Resolver
import Combine
class WelcomeViewModel: ObservableObject {
    
    @Published var dataRepository: DataRepository = Resolver.resolve()
    @Published var alreadyUser = false
    @Published var address: String = ""
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        dataRepository.$alreadyUser.assign(to: \.alreadyUser, on: self).store(in: &cancellables)
    }
    
    func onSubmit() {
        dataRepository.setAlreadyUser(address)
    }
}
