//
//  ErrorView+Design.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 24.10.2024.
//
import UIKit
import PureLayout

extension ErrorView: ViewDesignProtocol {

    func buildViews() {
        createViews()
        styleViews()
    }

    func createViews() {
        containerView = UIView()
        addSubview(containerView)

        imageView = UIImageView()
        containerView.addSubview(imageView)

        descriptionLabel = UILabel()
        containerView.addSubview(descriptionLabel)
    }
    
    func styleViews() {
        imageView.image = UIImage(named: "AppAlert")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .systemGray4

        descriptionLabel.textColor = .systemGray4
        descriptionLabel.textAlignment = .center
        descriptionLabel.font = .systemFont(ofSize: 16, weight: .medium)
    }
    
    func setConstraintsForViews() {
        containerView.autoPinEdgesToSuperviewEdges()

        imageView.autoAlignAxis(toSuperviewAxis: .vertical)
        imageView.autoAlignAxis(toSuperviewAxis: .horizontal)
        imageView.autoSetDimensions(to: CGSize(width: 200, height: 200))

        descriptionLabel.autoPinEdge(.top, to: .bottom, of: imageView, withOffset: 8)
        descriptionLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 16)
        descriptionLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 16)
    }
    
}
