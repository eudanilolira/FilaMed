//
//  LineView.swift
//  FIlaMed
//
//  Created by Danilo Araújo on 22/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import UIKit

class LineView: UIView {

    let doctorInformationView: DoctorInformationView = DoctorInformationView()
    let lineIndicatorView: LineIndicatorView = LineIndicatorView()
    let outputButton: UIButton = UIButton()

    public init() {
        super.init(frame: .zero)
        setupStyle()
        setupOutputButtonStyle()
        setupDoctorInformationView()
        setupLineIndicatorView(upperView: doctorInformationView)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupStyle() {
        self.backgroundColor = .systemGray6
    }

    func setupDoctorInformationView() {
        self.addSubview(self.doctorInformationView)
        self.doctorInformationView.setupConstraints()
    }

    func setupLineIndicatorView(upperView: UIView) {
        self.addSubview(self.lineIndicatorView)
        self.lineIndicatorView.setupConstraints(upperView)
    }

    func setupOutputButtonStyle() {
        self.outputButton.backgroundColor = .white
        self.outputButton.layer.cornerRadius = 8
        self.outputButton.setTitle("Sair da fila", for: .normal)
        self.outputButton.setTitleColor(.systemRed, for: .normal)
        self.outputButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        self.outputButton.contentHorizontalAlignment = .left
    }

    func setupOutputButtonConstraints() {
        self.addSubview(outputButton)
        self.outputButton.translatesAutoresizingMaskIntoConstraints = false
        self.outputButton.topAnchor.constraint(equalTo: lineIndicatorView.bottomAnchor, constant: 16).isActive = true
        self.outputButton.centerXAnchor.constraint(equalTo: superview!.centerXAnchor).isActive = true
        self.outputButton.widthAnchor.constraint(equalToConstant: 359).isActive = true
    }

    func setupConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.bottomAnchor.constraint(equalTo: superview!.bottomAnchor).isActive = true
        self.topAnchor.constraint(equalTo: superview!.topAnchor, constant: 24).isActive = true
        self.leadingAnchor.constraint(equalTo: superview!.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: superview!.trailingAnchor).isActive = true
        self.widthAnchor.constraint(equalTo: superview!.widthAnchor).isActive = true
        self.heightAnchor.constraint(equalTo: superview!.heightAnchor).isActive = true
    }
}

class LineScrollView: UIScrollView {

    let contentView: LineView = LineView()

    public init() {
        super.init(frame: .zero)
        self.addSubview(contentView)
        contentView.setupConstraints()
        contentView.setupOutputButtonConstraints()
        setupStyle()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupStyle() {
        self.backgroundColor = .systemGray6
    }
}
