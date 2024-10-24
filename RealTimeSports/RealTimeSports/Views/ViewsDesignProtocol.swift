//
//  ViewDesignProtocol.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 23.10.2024.
//

protocol ViewDesignProtocol {

    func createViews()

    func styleViews()

    func setConstraintsForViews()

    func setAccessibilityIdentifiers()

}

protocol ViewControllerDesignProtocol {

    func createViews()

    func styleViews()

    func setConstraintsForViews()

    func setAccessibilityIdentifiers()

}

extension ViewControllerDesignProtocol {

    func buildViews() {
        createViews()
        styleViews()
        setConstraintsForViews()
        setAccessibilityIdentifiers()
    }

}
