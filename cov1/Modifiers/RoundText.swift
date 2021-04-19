//
//  RoundText.swift
//  cov1
//
//  Created by Tobias P on 05.04.21.
//

import Foundation
import SwiftUI

struct RoundFont: ViewModifier {
        
    func body(content: Content) -> some View {
        content.font(.system(.largeTitle, design: .rounded))
    }
}
 
extension View {
    
    func roundFont() -> some View {
        self.modifier(RoundFont())
    }
}
