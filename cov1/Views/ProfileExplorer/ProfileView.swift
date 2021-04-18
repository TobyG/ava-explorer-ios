//
//  ProfileView.swift
//  cov1
//
//  Created by Tobias Pechatschek on 07.04.21.
//

import SwiftUI

struct ProfileView: View {

    @State private var isPresented = false
    @ObservedObject var viewModel = ProfileViewModel()

    var body: some View {
        
        VStack {
            TitleView(title: "Profile", subtitle: "")
            
            VStack {
                
                Text("Address:")
                    .font(.caption)
                    .foregroundColor(Color.gray)
                
                AddressButton
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
        
        Text("Main net")
            .font(.caption)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(6)
            .background(
                Capsule().foregroundColor(Color("AvaRed"))
            ).padding()
    }
    
    var Testnet: some View {
        
        Text("Test net")
            .font(.caption)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(6)
            .background(
                Capsule().foregroundColor(Color("AvaRed"))
            ).padding()
    }
    
    var AddressButton: some View {

            Button(action: {
                isPresented.toggle()
            }) {
                Image(systemName: "pencil").foregroundColor(.white)
                Text(viewModel.address)
            }
        
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
