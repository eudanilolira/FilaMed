//
//  DoctorInformationView.swift
//  FilaMed
//
//  Created by Danilo Araújo on 24/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import UIKit

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
