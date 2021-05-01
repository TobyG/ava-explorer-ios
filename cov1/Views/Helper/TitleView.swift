//
//  TitleView.swift
//  cov1
//
//  Created by Tobias P on 07.04.21.
//

import SwiftUI

struct TitleView: View {
    var title: String;
    var subtitle: String
    var body: some View {
        VStack {
            Text(title).foregroundColor(Color("AvaPurple")).font(Font.custom("Rubik-Regular", size: 40)).padding(.top, 80)
            
            Text(subtitle).foregroundColor(.gray).smallText()
            HStack {
                Spacer()
            }.padding(0)
        }.padding()
    }
}



struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(title: "Title", subtitle: "Subtitle")
    }
}
