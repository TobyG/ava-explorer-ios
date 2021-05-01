//
//  HomeView.swift
//  cov1
//
//  Created by Tobias P on 30.04.21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            AddressExplorerView()
                .tabItem {
                    Label("Tokens", systemImage: "bitcoinsign.circle")
                }
            
            NftExplorerView()
                .tabItem {
                    Label("NFTs", systemImage: "hexagon")
                }
            
            TransactionExplorerView()
                .tabItem {
                    Label("Transactions", systemImage: "arrow.up.arrow.down.circle")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
            
        }.accentColor(Color("AvaRed")).onAppear() {
            UITabBar.appearance().barTintColor = .white
        }.navigationBarBackButtonHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
