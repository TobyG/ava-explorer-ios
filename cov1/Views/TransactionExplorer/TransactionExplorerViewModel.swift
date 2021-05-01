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

    @Published var addressExplorerRepository: DataRepository = Resolver.resolve()
    @Published var transactions = [Transaction]()
    @Published var address: String = ""

    private var cancellables = Set<AnyCancellable>()
    
    init() {
       
        addressExplorerRepository.$transactionData.sink(receiveValue: { value in
            self.transactions = value.items
            
        }).store(in: &cancellables)
        
        addressExplorerRepository.$address.sink(receiveValue: { value in
            self.address = value
            
        }).store(in: &cancellables)
        
    }
    
}
