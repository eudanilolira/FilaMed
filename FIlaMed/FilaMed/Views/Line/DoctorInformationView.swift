//
//  DoctorInformationView.swift
//  FilaMed
//
//  Created by Danilo Araújo on 24/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import UIKit

class DoctorInformationView: UIView {

    let doctorImageView     = UIImageView()
    let doctorNameLabel     = UILabel()
    let doctorIdLabel       = UILabel()
    let clinicLabel         = UILabel()
    let clinicNameLabel     = UILabel()
    let division            = UIView()
    let specialityLabel     = UILabel()
    let specialityNameLabel = UILabel()

    public init() {
        super.init(frame: .zero)
        setupStyles()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: setupStyle Functions
    public func setupStyles() {
        setupStyle()
        setupDoctorImageViewStyle()
        setupDoctorNameLabelStyle()
        setupDoctorIdStyle()
        setupClinicLabelStyle()
        setupClinicNameLabelStyle()
        setupDivisionStyle()
        setupSpecialityLabelStyle()
        setupSpecialityNameLabelStyle()
    }

    private func setupStyle() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 8
        self.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 8, right: 16)
    }

    private func setupDoctorImageViewStyle() {
        let doctorImage = UIImage(systemName: "person.circle.fill")
        self.doctorImageView.image = doctorImage
    }

    private func setupDoctorNameLabelStyle() {
        self.doctorNameLabel.text = "Dra. Judith da Matta"
        self.doctorNameLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
    }

    private func setupDoctorIdStyle() {
        self.doctorIdLabel.text = "CRO - 7345"
        self.doctorIdLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        self.doctorIdLabel.textColor = #colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1) //#707070
    }

    private func setupDoctorNameLabelConstraints() {
        self.addSubview(doctorNameLabel)
        self.doctorNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.doctorNameLabel.topAnchor.constraint(equalTo: doctorImageView.bottomAnchor, constant: 4).isActive = true
        self.doctorNameLabel.centerXAnchor.constraint(equalTo: superview!.centerXAnchor).isActive = true
    }

    private func setupClinicLabelStyle() {
        let text = setSFSymbolToAttributedText(systemName: "house")
        text.append(NSAttributedString(string: " Clínica"))
        self.clinicLabel.attributedText = text
        self.clinicLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
    }

    private func setupClinicNameLabelStyle() {
        self.clinicNameLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        self.clinicNameLabel.textAlignment = .left
        self.clinicNameLabel.textColor = #colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)
        self.clinicNameLabel.text = "Unimed"
    }

    private func setupDivisionStyle() {
        self.division.backgroundColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    }

    private func setupSpecialityLabelStyle() {
        let text = setSFSymbolToAttributedText(systemName: "heart.circle")
        text.append(NSAttributedString(string: " Especialidade"))
        self.specialityLabel.attributedText = text
        self.specialityLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
    }

    private func setupSpecialityNameLabelStyle() {
        self.specialityNameLabel.text = "Ortodontista"
        self.specialityNameLabel.textAlignment = .left
        self.specialityNameLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        self.specialityNameLabel.textColor = #colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)
    }

    // MARK: setupConstraints Functions
    public func setupConstraints() {
        setupSelfConstraints()
        setupDoctorImageViewConstraints()
        setupDoctorNameLabelConstraints()
        setupDoctorIdLabelConstraints()
        setupClinicLabelConstraints()
        setupClinicNameLabelConstraints()
        setupDivisionConstraints()
        setupSpecialityLabelConstraints()
        setupSpecialityNameLabelConstraints()
    }

    private func setupSelfConstraints() {
        self.heightAnchor.constraint(equalToConstant: 216).isActive = true
    }

    private func setupDoctorImageViewConstraints() {
        self.addSubview(doctorImageView)
        self.doctorImageView.translatesAutoresizingMaskIntoConstraints = false
        self.doctorImageView.topAnchor.constraint(equalTo: superview!.topAnchor, constant: 16).isActive = true
        self.doctorImageView.centerXAnchor.constraint(equalTo: superview!.centerXAnchor).isActive = true
        self.doctorImageView.widthAnchor.constraint(equalToConstant: 56).isActive = true
        self.doctorImageView.heightAnchor.constraint(equalToConstant: 56).isActive = true
    }

    private func setupDoctorIdLabelConstraints() {
        self.addSubview(doctorIdLabel)
        self.doctorIdLabel.translatesAutoresizingMaskIntoConstraints = false
        self.doctorIdLabel.topAnchor.constraint(equalTo: doctorNameLabel.bottomAnchor, constant: 4).isActive = true
        self.doctorIdLabel.centerXAnchor.constraint(equalTo: superview!.centerXAnchor).isActive = true
    }

    private func setupClinicLabelConstraints() {
        self.addSubview(clinicLabel)
        self.clinicLabel.translatesAutoresizingMaskIntoConstraints = false
        self.clinicLabel.topAnchor.constraint(equalTo: doctorIdLabel.bottomAnchor, constant: 24).isActive = true
        self.clinicLabel.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor).isActive = true
    }

    private func setupClinicNameLabelConstraints() {
        self.addSubview(clinicNameLabel)
        self.clinicNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.clinicNameLabel.topAnchor.constraint(equalTo: clinicLabel.topAnchor).isActive = true
        self.clinicNameLabel.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor).isActive = true
    }

    private func setupDivisionConstraints() {
        self.addSubview(division)
        self.division.translatesAutoresizingMaskIntoConstraints = false
        division.heightAnchor.constraint(equalToConstant: 0.25).isActive = true
        division.topAnchor.constraint(equalTo: clinicLabel.bottomAnchor, constant: 8).isActive = true
        division.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor).isActive = true
        division.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }

    private func setupSpecialityLabelConstraints() {
        self.addSubview(specialityLabel)
        self.specialityLabel.translatesAutoresizingMaskIntoConstraints = false
        self.specialityLabel.topAnchor.constraint(equalTo: division.bottomAnchor, constant: 7.75).isActive = true
        self.specialityLabel.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor).isActive = true
    }

    private func setupSpecialityNameLabelConstraints() {
        self.addSubview(specialityNameLabel)
        self.specialityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.specialityNameLabel.topAnchor.constraint(equalTo: specialityLabel.topAnchor).isActive = true
        self.specialityNameLabel.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor).isActive = true
    }

    // MARK: Auxiliar Functions
    private func setSFSymbolToAttributedText(systemName symbolName: String) -> NSMutableAttributedString {
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(systemName: symbolName)
        let text: NSMutableAttributedString = NSMutableAttributedString(string: "")
        text.append(NSAttributedString(attachment: imageAttachment))

        return text
    }
}
