//
//  ProgressStepView.swift
//  FilaMed
//
//  Created by Wilton Ramos on 30/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import UIKit

class ProgressStepView: UIView, CodeView {

    var progressLabel: UILabel = UILabel()
    let indicatorView: UIView = UIView()

    public init() {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func buildViewHierarchy() {
        self.addSubview(self.progressLabel)
        self.addSubview(self.indicatorView)
    }

    func setupContraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.progressLabel.translatesAutoresizingMaskIntoConstraints = false

        self.progressLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.progressLabel.leftAnchor.constraint(equalTo: self.indicatorView.rightAnchor, constant: 10).isActive = true

        self.leftAnchor.constraint(equalTo: indicatorView.leftAnchor).isActive = true
        self.topAnchor.constraint(equalTo: indicatorView.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: indicatorView.bottomAnchor).isActive = true
        self.rightAnchor.constraint(equalTo: progressLabel.rightAnchor).isActive = true
    }

    func setupAdditionalConfiguration() {
        self.indicatorView.layer.cornerRadius = 9
        self.indicatorView.frame.size = CGSize(width: 18, height: 18)

        self.progressLabel.text = "Você ainda não entrou na fila"
        self.progressLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
    }
}
