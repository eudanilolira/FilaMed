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
        self.topAnchor.constraint(equalTo: superview!.topAnchor).isActive = true
        self.widthAnchor.constraint(equalToConstant: 343).isActive = true
        self.heightAnchor.constraint(equalToConstant: 216).isActive = true
        setupDoctorImageViewConstraints()
        setupDoctorNameLabel()
        setupCroLabel()
        setupClinicLabel()
        setupClinicNameLabel()
        setupSpecialityLabel()
        setupSpecialityNameLabel()
    }
    
    func setupDoctorImageViewConstraints() {
        self.addSubview(doctorImageView)
        let doctorImage = UIImage(systemName: "person.circle.fill")
        self.doctorImageView.image = doctorImage
        self.doctorImageView.translatesAutoresizingMaskIntoConstraints = false
        self.doctorImageView.topAnchor.constraint(equalTo: superview!.topAnchor, constant: 16).isActive = true
        self.doctorImageView.centerXAnchor.constraint(equalTo: superview!.centerXAnchor).isActive = true
    }
    
    func setupDoctorNameLabel() {
        self.addSubview(doctorNameLabel)
        self.doctorNameLabel.text = "Dra. Judith da Matta"
        self.doctorNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.doctorNameLabel.topAnchor.constraint(equalTo: doctorImageView.bottomAnchor, constant: 4).isActive = true
        self.doctorNameLabel.centerXAnchor.constraint(equalTo: superview!.centerXAnchor).isActive = true
    }
    
    func setupCroLabel() {
        self.addSubview(croLabel)
        self.croLabel.text = "CRO - 7345"
        self.croLabel.translatesAutoresizingMaskIntoConstraints = false
        self.croLabel.topAnchor.constraint(equalTo: doctorNameLabel.bottomAnchor, constant: 4).isActive = true
        self.croLabel.centerXAnchor.constraint(equalTo: superview!.centerXAnchor).isActive = true
    }
    
    func setupClinicLabel() {
        self.addSubview(clinicLabel)
        self.clinicLabel.text = "Clínica"
        self.clinicLabel.translatesAutoresizingMaskIntoConstraints = false
        self.clinicLabel.topAnchor.constraint(equalTo: croLabel.bottomAnchor, constant: 32).isActive = true
        self.clinicLabel.leftAnchor.constraint(equalTo: superview!.leftAnchor, constant: 48).isActive = true
    }
    
    func setupClinicNameLabel() {
        self.addSubview(clinicNameLabel)
        self.clinicNameLabel.text = "Unimed"
        self.clinicNameLabel.textAlignment = .left
        self.clinicNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.clinicNameLabel.topAnchor.constraint(equalTo: clinicLabel.topAnchor).isActive = true
        self.clinicNameLabel.rightAnchor.constraint(equalTo: superview!.rightAnchor, constant: 48).isActive = true
    }
    
    func setupSpecialityLabel() {
        self.addSubview(specialityLabel)
        self.specialityLabel.text = "Especialidade"
        self.specialityLabel.translatesAutoresizingMaskIntoConstraints = false
        self.specialityLabel.topAnchor.constraint(equalTo: clinicLabel.bottomAnchor, constant: 16).isActive = true
        self.specialityLabel.leftAnchor.constraint(equalTo: superview!.leftAnchor, constant: 48).isActive = true
    }
    
    func setupSpecialityNameLabel() {
        self.addSubview(specialityNameLabel)
        self.specialityNameLabel.text = "Ortodontista"
        self.specialityNameLabel.textAlignment = .left
        self.specialityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.specialityNameLabel.topAnchor.constraint(equalTo: specialityLabel.topAnchor).isActive = true
        self.specialityNameLabel.rightAnchor.constraint(equalTo: superview!.rightAnchor, constant: 48).isActive = true
    }
}
