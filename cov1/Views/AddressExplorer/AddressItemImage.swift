//
//  AddressItemImage.swift
//  cov1
//
//  Created by Tobias Pechatschek on 03.04.21.
//

import SwiftUI
import struct Kingfisher.KFImage

struct AddressItemImage: View {
    var url: String
    var body: some View {
        KFImage(URL(string: self.url)).placeholder {
            // Placeholder while downloading.
            Image(systemName: "photo")
                .font(.largeTitle)
                .opacity(0.3)
        }
        .resizable()
        .frame(width: 44, height: 44).cornerRadius(30)
    }
}

struct AddressItemImage_Previews: PreviewProvider {
    static var previews: some View {
        AddressItemImage(url: "https://github.com/onevcat/Kingfisher/blob/master/images/kingfisher-1.jpg?raw=true"
        )
    }
}