//
//  ToggleElementViewModel.swift
//  cov1
//
//  Created by Tobias P on 04.04.21.
//

import Foundation
import SwiftUI
import Combine

class ToggleElementViewModel: ObservableObject, Identifiable {
    @Published var toggleElement: ToggleElement

    var id: String = ""

    @Published var buttonColor = Color(.secondarySystemBackground)
    @Published var textColor = Color.white
    @Published var state = false
    private var cancellables = Set<AnyCancellable>()

    init(toggleElement: ToggleElement) {
        self.toggleElement = toggleElement
        $toggleElement.sink(receiveValue: { value in
            self.id = value.id
            self.state = value.isOn
            if value.isOn {
                self.buttonColor = Color("AvaRed")
                self.textColor = .white
            } else {
                self.buttonColor = Color.white
                self.textColor = Color.gray
            }
        }).store(in: &cancellables)
    }
}
