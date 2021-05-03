//
//  ToggleElementView.swift
//  cov1
//
//  Created by Tobias P on 04.04.21.
//

import SwiftUI

struct ToggleElementView: View {
    
    @ObservedObject var viewModel: ToggleElementViewModel
    @ObservedObject var addressExplorerViewModel: AddressExplorerViewModel
    
    var body: some View {
        HStack {
            Text(viewModel.toggleElement.text)
                .smallText()
                .foregroundColor(viewModel.textColor)
                .padding(6)
        }
        .background(
            Capsule().foregroundColor(viewModel.buttonColor)
        )
        .onTapGesture {
            withAnimation {
                self.viewModel.toggleElement.isOn.toggle()
                self.addressExplorerViewModel.onFilter()
            }
        }
    }
}



struct ToggleElementView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleElementView(viewModel: ToggleElementViewModel(
                            toggleElement: ToggleElement(
                                id: "8383838",
                                isOn: false,
                                text: "cryptocurrency")),
                          addressExplorerViewModel: AddressExplorerViewModel())
            .previewLayout(.sizeThatFits)
    }
}
