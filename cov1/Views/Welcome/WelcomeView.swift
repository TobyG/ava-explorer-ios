//
//  WelcomeView.swift
//  cov1
//
//  Created by Tobias P on 30.04.21.
//

import SwiftUI

struct WelcomeView: View {
    
    @ObservedObject var viewModel = WelcomeViewModel()
    
    var body: some View {
        
        NavigationView {
            VStack {
                Image("avax").resizable().frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/).padding(.top, 50)
                Text("Avalanche").font(Font.custom("Rubik-Regular", size: 30)).foregroundColor(Color("AvaPurple"))
                Text("C-Chain Information").smallText().foregroundColor(.gray)
                Text("Welcome!").largeText().foregroundColor(Color("AvaPurple")).padding(.top, 50)
                Text("Please enter your C-Chain address:").mediumText().foregroundColor(Color("AvaPurple"))
                
                NavigationLink(destination: HomeView(), isActive: $viewModel.alreadyUser) {
                    EmptyView()
                }
                
                Address
                Continue
                Spacer()
            }
        }
        
    }
}

private extension WelcomeView {
    
    var Address: some View {
        TextField("0x000000000000000000000000", text: $viewModel.address).mediumText().padding()
            .background(Color("AvaGray"))
            .cornerRadius(6).padding()
    }
    
    var Continue: some View {
        
        Button(action: {
            viewModel.onSubmit()
            
        }) {
            Text("Continue")
                .mediumText()
                .foregroundColor(validAddress() ? .white : Color("AvaPurple"))
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(6)
                .background(
                    Rectangle().cornerRadius(6).foregroundColor(validAddress() ? Color("AvaRedButton") : Color("AvaGray"))
                ).padding()
        }.disabled(!validAddress())
    }
    
    func validAddress() -> Bool {
        /*for char in viewModel.address {
         if (!char.isHexDigit ) {
         return false
         }
         }*/
        return viewModel.address.count == 42
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
