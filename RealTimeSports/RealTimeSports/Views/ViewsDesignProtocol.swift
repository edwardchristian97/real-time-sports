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

}

protocol ViewControllerDesignProtocol {

    func createViews()

    func styleViews()

    func setConstraintsForViews()

}

extension ViewControllerDesignProtocol {

    func buildViews() {
        createViews()
        styleViews()
        setConstraintsForViews()
    }

}
