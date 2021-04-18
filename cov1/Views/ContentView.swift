//
//  ContentView.swift
//  cov1
//
//  Created by Tobias Pechatschek on 03.04.21.
//

import SwiftUI

struct ContentView: View {
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
            
            /*OrderView()
             .tabItem {
             Label("Order", systemImage: "square.and.pencil")
             }*/
        }.accentColor(Color("AvaRed")).onAppear() {
            UITabBar.appearance().barTintColor = .white
            }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
