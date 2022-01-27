//
//  Binding-OnChange.swift
//  BerkinPortfolio
//
//  Created by Berkin Sili on 27.01.2022.
//

import SwiftUI

extension Binding {
    func onChange( _ handler: @escaping () -> Void) -> Binding<Value> {
        Binding(
            get: { self.wrappedValue },
            set: { newValue in
                self.wrappedValue = newValue
                handler()
            }
        )
    }
}
