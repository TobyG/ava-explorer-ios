//
//  AddressExplorerRepository.swift
//  cov1
//
//  Created by Tobias P on 03.04.21.
//

import Foundation
import Alamofire
import Combine
import NotificationBannerSwift

class DataRepository: ObservableObject {
    @Published var addressItems = [AddressItem]()
    @Published var addressBalance: AddressBalance = AddressBalance(address: "", updated_at: "", next_update_at: "", quote_currency: "", chain_id: 0, items: [])
    @Published var addressBalanceResponse: AddressBalanceResponse = AddressBalanceResponse(data: AddressBalance(address: "", updated_at: "", next_update_at: "", quote_currency: "", chain_id: 0, items: []))
    
    @Published var transactionData: TransactionData = TransactionData(address: "", updated_at: "", next_update_at: "", quote_currency: "", chain_id: 0, items: [])
    let defaults = UserDefaults.standard
    @Published var address: String = "" {
        didSet {
            print("set address")
            self.loadTransactions()
            self.loadTokensAndNfts()
        }
    }
    
    @Published var didSelectMainNet: Bool = true
    
    var user: String = "onemillionwallets"
    
    @Published var tokenLoading: Bool = false
    @Published var transactionsLoading: Bool = false
    
    @Published var alreadyUser: Bool = false
    
    private var apiCancellationToken: AnyCancellable?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        self.getAddress()
    }
    

    
    func loadTokensAndNfts() {
        self.tokenLoading = true

        let url = "https://api.covalenthq.com/v1/43114/address/" + address + "/balances_v2/?nft=true"
        let headers: HTTPHeaders = [.authorization(username: user, password: "")]
        
        AF.request(url, headers: headers)
            .responseDecodable(of: AddressBalanceResponse.self) { response in

                if(response == nil) {
                    let banner = NotificationBanner(title: "Error", subtitle: "couldnt parse response", style: .success)
                    banner.show()
                }
                guard let res = response.value else { return }
                self.addressBalanceResponse = res
                self.tokenLoading = false
            }
        
    }
    
    func loadTransactions() {
        self.transactionsLoading = true

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
        // self.getAddress()
    }
    
    func getAddress() {
        self.getDidSelectMainNet()
        print("getting alreadyUser")
        alreadyUser = defaults.bool(forKey: "alreadyUser")
        print("after getting alreadyUser")
        if(alreadyUser) {
            print("inside if")
            address = defaults.string(forKey: "address") ?? "click to change address"
            self.loadTokensAndNfts()
            self.loadTransactions()
        }
    }
    
    
    func getDidSelectMainNet() {
        didSelectMainNet = defaults.bool(forKey: "didSelectMainNet")
    }
    
    func changeNet(_ val: Bool) {
        defaults.set(val, forKey: "didSelectMainNet")
        self.didSelectMainNet = val
    }
    
    func setAlreadyUser(_ address: String) {
        defaults.set(true, forKey: "alreadyUser")
        alreadyUser = true
        self.changeAddress(address: address)
        
    }
    
    func resetUser() {
        defaults.set(false, forKey: "alreadyUser")
        alreadyUser = false
        self.changeAddress(address: "")
    }
    
    func getAlreadyUser() {
        alreadyUser = defaults.bool(forKey: "alreadyUser")
    }
    
    
}
