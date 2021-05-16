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

    @Published var dataRepository: DataRepository = Resolver.resolve()
    @Published var transactions = [Transaction]()
    @Published var address: String = ""
    @Published var isLoading: Bool = false

    private var cancellables = Set<AnyCancellable>()
    
    init() {
       
        dataRepository.$transactionData.sink(receiveValue: { value in
            self.transactions = value.items
            
        }).store(in: &cancellables)
        
        dataRepository.$transactionsLoading.assign(to: \.isLoading, on: self).store(in: &cancellables)
        dataRepository.$address.assign(to: \.address, on: self).store(in: &cancellables)
    }
    
    func onRefresh() {
        self.dataRepository.loadTransactions()
        
    }
}
