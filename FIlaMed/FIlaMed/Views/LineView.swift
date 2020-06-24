//
//  LineView.swift
//  FIlaMed
//
//  Created by Danilo Araújo on 22/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import UIKit

class LineView: UIScrollView {
    
    let doctorInformationView: DoctorInformationView = DoctorInformationView()
    let lineIndicatiorView: LineIndicatorView = LineIndicatorView()
    
    public init() {
        super.init(frame: .zero)
        setupStyle()
        setupDoctorInformationView()
        setupLineIndicatorView(upperView: doctorInformationView)
        self.contentSize.height = 530
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
    
    public func setupConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: superview!.leadingAnchor).isActive = true
        self.topAnchor.constraint(equalTo: superview!.topAnchor).isActive = true
        self.widthAnchor.constraint(equalTo: superview!.widthAnchor).isActive = true
        self.heightAnchor.constraint(equalTo: superview!.heightAnchor).isActive = true
    }
    
}

class DoctorInformationView: UIView {
    
    let doctorImageView = UIImageView()
    let doctorNameLabel = UILabel()
    let croLabel = UILabel()
    let clinicLabel = UILabel()
    let clinicNameLabel = UILabel()
    let specialityLabel = UILabel()
    let specialityNameLabel = UILabel()
    
    public init() {
        super.init(frame: .zero)
        setupStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStyle() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 8
    }
    
    func setupConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: superview!.centerXAnchor).isActive = true
        self.topAnchor.constraint(equalTo: superview!.topAnchor, constant: 16).isActive = true
        self.widthAnchor.constraint(equalToConstant: 345).isActive = true
        self.heightAnchor.constraint(equalToConstant: 233).isActive = true
    }
}

class LineIndicatorView: UIView {
    
    public override init(frame: CGRect) {
        super.init(frame: .zero)
        setupStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStyle() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 8
    }
    
    func setupConstraints(_ upperView: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: superview!.centerXAnchor).isActive = true
        self.topAnchor.constraint(equalTo: upperView.bottomAnchor, constant: 32).isActive = true
        self.widthAnchor.constraint(equalToConstant: 345).isActive = true
        self.heightAnchor.constraint(equalToConstant: 230).isActive = true
    }
}
