//
//  ErrorView.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 24.10.2024.
//
import UIKit

class ErrorView: UIView {

    var containerView: UIView!
    var imageView: UIImageView!
    var descriptionLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        buildViews()
    }

    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        setConstraintsForViews()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        styleViews()
    }

    func setDescriptionLabel(_ descriptionText: String) {
        descriptionLabel.text = descriptionText
    }

}
