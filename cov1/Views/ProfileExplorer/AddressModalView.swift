//
//  AddressModalView.swift
//  cov1
//
//  Created by Tobias Pechatschek on 18.04.21.
//

import SwiftUI

struct AddressModalView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel = AddressModalViewModel()
    
    
    var body: some View {
        
        VStack {
            
            Address
            
            HStack {
                Cancel
                Save
            }
        }

    }
}

private extension AddressModalView {
    
    var Address: some View {
        TextField("Title", text: $viewModel.address).font(.caption).padding()
            .background(Color("AvaGray"))
            .cornerRadius(10).padding()
    }
    
    var Cancel: some View {
        
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Text("Cancel")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(6)
                .background(
                    Capsule().foregroundColor(Color("AvaRed"))
                ).padding()
        }

    }
    
    var Save: some View {
        
        Button(action: {
            viewModel.updateAddress()
            presentationMode.wrappedValue.dismiss()

        }) {
            Text("Save")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(6)
                .background(
                    Capsule().foregroundColor(Color("AvaRed"))
                ).padding()
        }
        
    }
}

struct AddressModalView_Previews: PreviewProvider {
    static var previews: some View {
        AddressModalView()
    }
}
