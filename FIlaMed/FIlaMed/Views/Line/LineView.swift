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
    let lineIndicatiorView: LineIndicatorView = LineIndicatorView()
    
    public init() {
        super.init(frame: .zero)
        setupStyle()
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
        self.addSubview(self.lineIndicatiorView)
        self.lineIndicatiorView.setupConstraints(upperView)

    }
    
    func setupConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.bottomAnchor.constraint(equalTo: superview!.bottomAnchor).isActive = true
        self.topAnchor.constraint(equalTo: superview!.topAnchor, constant: 16).isActive = true
        self.leadingAnchor.constraint(equalTo: superview!.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: superview!.trailingAnchor).isActive = true
        self.widthAnchor.constraint(equalTo: superview!.widthAnchor).isActive = true
        self.heightAnchor.constraint(equalTo: superview!.heightAnchor).isActive = true
    }
}

class LineScrollView: UIScrollView {
    
    let lineView: LineView = LineView()
    
    public init() {
        super.init(frame: .zero)
        self.addSubview(lineView)
        lineView.setupConstraints()
        setupStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupStyle() {
        self.backgroundColor = .systemGray6
    }
}

