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
    
    public init() {
        super.init(frame: .zero)
        setupStyle()
        setupDoctorInformationView()
        //setupConstraints()
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
    
    func setupConstraints(){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: superview!.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: superview!.centerYAnchor).isActive = true
        self.heightAnchor.constraint(equalTo: superview!.heightAnchor).isActive = true
        self.widthAnchor.constraint(equalTo: superview!.widthAnchor).isActive = true
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
        //let topYAnchor = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: UIApplication.shared.statusBarFrame, attribute: .bottom, multiplier: 1.0, constant: 32)
        self.topAnchor.constraint(equalTo: superview!.topAnchor, constant: 44).isActive = true
        self.widthAnchor.constraint(equalToConstant: 343).isActive = true
        self.heightAnchor.constraint(equalToConstant: 233).isActive = true
    }
}
