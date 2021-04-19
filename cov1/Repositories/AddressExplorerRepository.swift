//
//  AddressExplorerRepository.swift
//  cov1
//
//  Created by Tobias P on 03.04.21.
//

import Foundation
import Alamofire
import Combine

class BaseAddressExplorerRepository {
    @Published var addressItems = [AddressItem]()
    @Published var addressBalance: AddressBalance = AddressBalance(address: "", updated_at: "", next_update_at: "", quote_currency: "", chain_id: 0, items: [])
    @Published var addressBalanceResponse: AddressBalanceResponse = AddressBalanceResponse(data: AddressBalance(address: "", updated_at: "", next_update_at: "", quote_currency: "", chain_id: 0, items: []))
    
    @Published var transactionData: TransactionData = TransactionData(address: "", updated_at: "", next_update_at: "", quote_currency: "", chain_id: 0, items: [])
    
    @Published var address: String = ""
}

protocol AddressExplorerRepository: BaseAddressExplorerRepository {
    func loadData(address: String)
    
    func changeAddress(address: String)
    func getAddress()
}



class HttpAddressExplorerRepository: BaseAddressExplorerRepository, AddressExplorerRepository, ObservableObject {
    
    let defaults = UserDefaults.standard

    override init() {
        super.init()
        self.getAddress()
    }
    
    private let networkClient = NetworkClient()
    private var apiCancellationToken: AnyCancellable?
    private var cancellables = Set<AnyCancellable>()
    
    func loadData(address: String) {
        
        let user = "onemillionwallets"
        let url = "https://api.covalenthq.com/v1/43114/address/" + address + "/balances_v2/?nft=true"
        let headers: HTTPHeaders = [.authorization(username: user, password: "")]
                
        AF.request(url, headers: headers)
            .responseDecodable(of: AddressBalanceResponse.self) { response in

                guard let res = response.value else { return }
                self.addressBalanceResponse = res
            }
        
    }
    
    func loadTransactions(address: String) {
        let user = "onemillionwallets"
        let url = "https://api.covalenthq.com/v1/43114/address/" + address + "/transactions_v2/"
        let headers: HTTPHeaders = [.authorization(username: user, password: "")]
                
        AF.request(url, headers: headers)
            .responseDecodable(of: TransactionResponse.self) { response in
                guard let res = response.value else { return }
                
                self.transactionData = res.data
            }
    }
    
    func changeAddress(address: String) {
        defaults.set(address, forKey: "address")
        self.address = address
        self.getAddress()
    }
    
    func getAddress() {
        address = defaults.string(forKey: "address") ?? ""
        self.loadData(address: address)
        self.loadTransactions(address: address)
    }
    
    
}
