//
//  TitleView.swift
//  cov1
//
//  Created by Tobias Pechatschek on 07.04.21.
//

import SwiftUI

struct TitleView: View {
    var title: String;
    var subtitle: String
    var body: some View {
        VStack {
            Text(title).foregroundColor(Color("AvaPurple")).font(.system(.largeTitle, design: .rounded)).fontWeight(.regular).padding(.top, 100)
            
            Text(subtitle).foregroundColor(.gray).font(.system(.caption, design: .rounded)).fontWeight(.light)
        }.padding()
    }
}



struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(title: "Title", subtitle: "Subtitle")
    }
}
