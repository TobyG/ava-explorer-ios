//
//  HomeView.swift
//  cov1
//
//  Created by Tobias P on 30.04.21.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()

    var body: some View {
        TabView {
            AddressExplorerView()
                .tabItem {
                    Label("Tokens", systemImage: "bitcoinsign.circle")
                }
            
            NftExplorerView()
                .tabItem {
                    Label("NFTs", systemImage: "n.circle")
                }
            
            TransactionExplorerView()
                .tabItem {
                    Label("Transactions", systemImage: "arrow.up.arrow.down.circle")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
            
        }.accentColor(Color("AvaRedButton")).navigationBarBackButtonHidden(true).edgesIgnoringSafeArea(.top)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
