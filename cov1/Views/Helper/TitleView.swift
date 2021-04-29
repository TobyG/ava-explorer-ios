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
            //Text(title).foregroundColor(Color("AvaPurple")).font(.system(.largeTitle, design: .rounded)).fontWeight(.regular).padding(.top, 100)
            Text(title).foregroundColor(Color("AvaPurple")).font(Font.custom("Rubik-Regular", size: 40)).padding(.top, 100)
            // Text(subtitle).foregroundColor(.gray).font(.system(.caption, design: .rounded)).fontWeight(.light)
            Text(subtitle).foregroundColor(.gray).smallText()
        }.padding()
    }
}



struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(title: "Title", subtitle: "Subtitle")
    }
}
