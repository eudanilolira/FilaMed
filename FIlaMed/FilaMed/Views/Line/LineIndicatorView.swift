//
//  LineIndicatorView.swift
//  FilaMed
//
//  Created by Danilo Araújo on 24/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import UIKit

class LineIndicatorView: UIView, CodeView {

    let leftLocationLabel: UILabel = UILabel()
    let timeLeftLabel: UILabel = UILabel()
    let placeTimeLabel: UILabel = UILabel()
    let waitTimeLabel: UILabel = UILabel()

    let progressStackView = ProgressStackView()

    public override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func buildViewHierarchy() {
        self.addSubview(progressStackView)
        self.addSubview(leftLocationLabel)
        self.addSubview(placeTimeLabel)
        self.addSubview(timeLeftLabel)
        self.addSubview(waitTimeLabel)
    }

    func setupContraints() {
        self.progressStackView.translatesAutoresizingMaskIntoConstraints = false
        self.leftLocationLabel.translatesAutoresizingMaskIntoConstraints = false
        self.placeTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.timeLeftLabel.translatesAutoresizingMaskIntoConstraints = false
        self.waitTimeLabel.translatesAutoresizingMaskIntoConstraints = false

        self.progressStackView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor).isActive = true
        self.progressStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true

        self.leftLocationLabel.topAnchor.constraint(equalTo: self.progressStackView.bottomAnchor, constant: 20).isActive = true
        self.leftLocationLabel.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor).isActive = true

        self.timeLeftLabel.topAnchor.constraint(equalTo: self.leftLocationLabel.topAnchor).isActive = true
        self.timeLeftLabel.leadingAnchor.constraint(equalTo: self.leftLocationLabel.trailingAnchor, constant: 5).isActive = true

        self.placeTimeLabel.topAnchor.constraint(equalTo: self.leftLocationLabel.bottomAnchor, constant: 10).isActive = true
        self.placeTimeLabel.leftAnchor.constraint(equalTo: self.leftLocationLabel.leftAnchor).isActive = true

        self.waitTimeLabel.topAnchor.constraint(equalTo: self.placeTimeLabel.topAnchor).isActive = true
        self.waitTimeLabel.leadingAnchor.constraint(equalTo: self.placeTimeLabel.trailingAnchor, constant: 5).isActive = true
    }

    func setupAdditionalConfiguration() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 8
        self.layoutMargins = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)

        self.leftLocationLabel.text = "Saia de onde está em: "
        self.timeLeftLabel.text = "15 minutos"
        self.placeTimeLabel.text = "Tempo de espera no local: "
        self.waitTimeLabel.text = "3 minutos"

        self.leftLocationLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        self.placeTimeLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        self.timeLeftLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        self.waitTimeLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)

    }
}
