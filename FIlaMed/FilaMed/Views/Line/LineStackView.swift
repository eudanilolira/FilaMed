//
//  LineView.swift
//  FIlaMed
//
//  Created by Danilo Araújo on 22/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import UIKit

class LineStackView: UIStackView, CodeView {

    let doctorInformationView: DoctorInformationView = DoctorInformationView()
    let lineIndicatorView: LineIndicatorView = LineIndicatorView()
    let roteButton: RoteButton = RoteButton()
    let outputButton: OutputButton = OutputButton()

    public init() {
        super.init(frame: .zero)
        setupView()
        outputButton.addTarget(self, action: #selector(touchedOutputButton), for: .touchUpInside)
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupStyle() {

    }

    func buildViewHierarchy() {
        self.addArrangedSubview(doctorInformationView)
        self.addArrangedSubview(lineIndicatorView)
        self.addArrangedSubview(roteButton)
        self.addArrangedSubview(outputButton)
    }

    func setupContraints() {
        self.doctorInformationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.doctorInformationView.heightAnchor.constraint(equalToConstant: 216)
        ])

        self.lineIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.lineIndicatorView.heightAnchor.constraint(equalToConstant: 216)
        ])
    }

    func setupAdditionalConfiguration() {
        self.axis = .vertical
        self.spacing = 24
    }

    @IBAction func touchedOutputButton() {
        callOutputAlert()
    }

    func callOutputAlert() {
        print("Deus é mais")
    }

}
