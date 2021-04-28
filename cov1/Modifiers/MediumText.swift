//
//  MediumText.swift
//  cov1
//
//  Created by Tobias P on 27.04.21.
//

import Foundation
import SwiftUI

struct MediumText: ViewModifier {
        
    func body(content: Content) -> some View {
        content.font(Font.custom("Rubik-Light", size: 16))
    }
}
 
extension View {
    
    func mediumText() -> some View {
        self.modifier(MediumText())
    }
}
