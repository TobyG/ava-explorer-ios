//
//  AddressExplorer.swift
//  cov1
//
//  Created by Tobias Pechatschek on 03.04.21.
//

import SwiftUI

struct AddressExplorerView: View {
    
    @ObservedObject var viewModel = AddressExplorerViewModel()
    
    var body: some View {
        NavigationView{
            VStack {
                TitleView(title: "Tokens", subtitle: "Avalanche C-Chain")
                ScrollView {
                    
                    TypeFilters.padding(.leading).padding(.top, 2)
                    TokenList
                    
                }
            }.background(Color("AvaGray"))
            .navigationBarHidden(true).edgesIgnoringSafeArea(.top)
            
        }
        
    }
}

private extension AddressExplorerView {
    
    var TypeFilters: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(viewModel.typeFilterViewModels) { type in
                    ToggleElementView(viewModel: type, addressExplorerViewModel: self.viewModel)
                }
            }
        }
    }
    
    
    var TokenList: some View {
        LazyVStack {
            /*ForEach(0..<viewModel.filteredAddressItems.count, id: \.self) { index in*/
            ForEach(0..<viewModel.filteredAddressItems.count, id: \.self) { index in
                AddressItemView(addressItem: viewModel.filteredAddressItems[index])
            }
        }.padding().padding(.top, 0).background(Color.white).cornerRadius(30)
    }
    
}

struct AddressExplorerView_Previews: PreviewProvider {
    static var previews: some View {
        AddressExplorerView()
    }
}
