//
//  LineView.swift
//  FIlaMed
//
//  Created by Danilo Araújo on 22/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import UIKit

class LineStackView: UIStackView {

    let doctorInformationView: DoctorInformationView = DoctorInformationView()
    let lineIndicatorView: LineIndicatorView = LineIndicatorView()
    let outputButton: OutputButton = OutputButton()

    public init() {
        super.init(frame: .zero)
        setupStyle()
        //self.outputButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        self.addArrangedSubview(doctorInformationView)
        self.addArrangedSubview(lineIndicatorView)
        self.addArrangedSubview(outputButton)
        setupDoctorInformationView()
        setupLineIndicatorView(upperView: doctorInformationView)
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupStyle() {
        self.axis = .vertical
        self.spacing = 24
        //self.distribution = .equalCentering
        //self.alignment = .fill
    }

    public func setupConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: superview!.layoutMarginsGuide.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: superview!.layoutMarginsGuide.trailingAnchor, constant: -8).isActive = true
        self.topAnchor.constraint(equalTo: superview!.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: superview!.bottomAnchor).isActive = true
        self.widthAnchor.constraint(equalTo: superview!.widthAnchor).isActive = true
    }

    func setupDoctorInformationView() {
        self.doctorInformationView.setupConstraints()
    }

    func setupLineIndicatorView(upperView: UIView) {
        self.lineIndicatorView.setupConstraints(upperView)
    }
}
