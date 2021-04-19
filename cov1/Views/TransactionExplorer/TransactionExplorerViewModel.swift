//
//  TransactionExplorerViewModel.swift
//  cov1
//
//  Created by Tobias P on 08.04.21.
//
import Foundation
import Combine
import Resolver

class TransactionExplorerViewModel: ObservableObject {

    @Published var addressExplorerRepository: AddressExplorerRepository = Resolver.resolve()
    @Published var transactions = [Transaction]()

    private var cancellables = Set<AnyCancellable>()
    
    init() {
       
        addressExplorerRepository.$transactionData.sink(receiveValue: { value in
            self.transactions = value.items
            
        }).store(in: &cancellables)
        
    }
    
}
