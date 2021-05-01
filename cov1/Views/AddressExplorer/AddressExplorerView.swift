//
//  AddressExplorer.swift
//  cov1
//
//  Created by Tobias P on 03.04.21.
//

import SwiftUI
import SwiftUICharts

struct AddressExplorerView: View {
    
    @ObservedObject var viewModel = AddressExplorerViewModel()
    
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
                    ScrollView {
                        
                        TokenList
                        MultiLineChartView(data: [([8,32,11,23,40,28], GradientColors.green), ([90,99,78,111,70,60,77], GradientColors.purple), ([34,56,72,38,43,100,50], GradientColors.orngPink)], title: "Title")

                        LineView(data: [8,23,54,32,12,37,7,23,43], title: "Line chart", legend: "Full screen").padding() // legend is optional, use optional .padding()

                        
                    }.padding(0)
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
            ForEach(0..<viewModel.filteredAddressItems.count, id: \.self) { index in
                AddressItemView(addressItem: viewModel.filteredAddressItems[index]).padding(0).padding(.leading, 10).padding(.trailing, 10)
                Divider()

            }
        }.background(Color.white).cornerRadius(30)
    }
    
}

struct AddressExplorerView_Previews: PreviewProvider {
    static var previews: some View {
        AddressExplorerView()
    }
}
