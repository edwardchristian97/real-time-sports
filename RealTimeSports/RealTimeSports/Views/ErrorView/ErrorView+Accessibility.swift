//
//  ErrorView+Accessibility.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 25.10.2024.
//

extension ErrorView {

    override var isAccessibilityElement: Bool {
        get {
            return true
        }
        set {}
    }

    override var accessibilityHint: String? {
        get {
            return "Error view when something went wrong"
        }
        set {}
    }

}
