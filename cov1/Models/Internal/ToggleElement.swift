//
//  ToggleElement#.swift
//  cov1
//
//  Created by Tobias P on 04.04.21.
//

import Foundation

public struct ToggleElement: Hashable {
    var id: String = UUID().uuidString
    var isOn: Bool
    var text: String

}
