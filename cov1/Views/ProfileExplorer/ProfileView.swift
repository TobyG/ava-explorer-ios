//
//  ProfileView.swift
//  cov1
//
//  Created by Tobias P on 07.04.21.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var isPresented = false
    @ObservedObject var viewModel = ProfileViewModel()
    
    var body: some View {
        
        VStack {
            TitleView(title: "Profile", subtitle: "")
            
            VStack {
                
                Text("Address:").smallText()
                    .foregroundColor(Color.gray)
                
                AddressButton
                
                Text("Network:").smallText()
                    .foregroundColor(Color.gray)
                
                HStack {
                    Mainnet
                    Testnet
                }
                
                Spacer()
            }.padding().padding(.top, 0).background(Color.white).cornerRadius(30)
            
            
        }.background(Color("AvaGray"))
        .navigationBarHidden(true).edgesIgnoringSafeArea(.top).fullScreenCover(isPresented: $isPresented, content: AddressModalView.init)
        
    }
}

private extension ProfileView {
    
    var Mainnet: some View {
        
        Button(action: {
            viewModel.toggleNet(true)
        }) {
            Text("Main net")
                .mediumText().foregroundColor(viewModel.didSelectMainNet ? .white : Color("AvaPurple"))
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(6)
                .background(
                    Rectangle().cornerRadius(6).foregroundColor(viewModel.didSelectMainNet ? Color("AvaRed") : Color("AvaGray"))
                )
        }.padding()
    }
    
    var Testnet: some View {
        
        Button(action: {
            viewModel.toggleNet(false)
        }) {
            Text("Test net")
                .mediumText().foregroundColor(viewModel.didSelectMainNet ? Color("AvaPurple") : .white)
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(6)
                .background(
                    Rectangle().cornerRadius(6).foregroundColor(viewModel.didSelectMainNet ? Color("AvaGray") : Color("AvaRed"))
                )
        }.padding()
    }
    
    var AddressButton: some View {
        
        Button(action: {
            isPresented.toggle()
        }) {
            Text(viewModel.address).mediumText().foregroundColor(Color("AvaRed"))
        }.padding()
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
