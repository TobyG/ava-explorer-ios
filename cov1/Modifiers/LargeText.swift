//
//  LargeText.swift
//  cov1
//
//  Created by Tobias P on 27.04.21.
//

import Foundation
import SwiftUI

struct LargeText: ViewModifier {
        
    func body(content: Content) -> some View {
        content.font(Font.custom("Rubik-Light", size: 25))
    }
}
 
extension View {
    
    func largeText() -> some View {
        self.modifier(LargeText())
    }
}
