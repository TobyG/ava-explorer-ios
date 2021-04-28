//
//  SmallText.swift
//  cov1
//
//  Created by Tobias P on 27.04.21.
//

import Foundation
import SwiftUI

struct SmallText: ViewModifier {
        
    func body(content: Content) -> some View {
        content.font(Font.custom("Rubik-Light", size: 11))
    }
}
 
extension View {
    
    func smallText() -> some View {
        self.modifier(SmallText())
    }
}
