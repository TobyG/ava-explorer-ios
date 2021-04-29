//
//  MediumTextRegular.swift
//  cov1
//
//  Created by Tobias P on 28.04.21.
//

import Foundation
import SwiftUI

struct MediumTextReg: ViewModifier {
        
    func body(content: Content) -> some View {
        content.font(Font.custom("Rubik-Medium", size: 16))
    }
}
 
extension View {
    
    func mediumTextReg() -> some View {
        self.modifier(MediumTextReg())
    }
}
