//
//  AddressExplorer.swift
//  cov1
//
//  Created by Tobias P on 03.04.21.
//

import SwiftUI
import SwiftUICharts
import SwiftUIRefresh

struct AddressExplorerView: View {
    
    @ObservedObject var viewModel = AddressExplorerViewModel()
    @State private var isShowing = false
    
    var body: some View {
        NavigationView{
            VStack {
                TitleView(title: "Tokens", subtitle: "Avalanche C-Chain")
                
                if (viewModel.isLoading) {
                    ProgressView()
                    Spacer()
                }
                else {
                    TypeFilters.padding(.leading).padding(.top, 2)
                    
                    TokenList
                    
                    
                }
                
            }.background(Color("AvaGrayBackground"))
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
        List {
            ForEach(0..<viewModel.filteredAddressItems.count, id: \.self) { index in
                TokenItemView(addressItem: viewModel.filteredAddressItems[index])
                
            }.listRowBackground(Color("ListBackground"))
        }.listStyle(InsetListStyle()).pullToRefresh(isShowing: $isShowing) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.isShowing = false
                self.viewModel.onRefresh()
            }
        }
        .onChange(of: self.isShowing) { value in
        }
    }
    
}

struct AddressExplorerView_Previews: PreviewProvider {
    static var previews: some View {
        AddressExplorerView(viewModel: AddressExplorerViewModel())
    }
}
