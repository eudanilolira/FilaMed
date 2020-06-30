//
//  DoctorInformationView.swift
//  FilaMed
//
//  Created by Danilo Araújo on 24/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import UIKit

class DoctorInformationView: UIView, CodeView {

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
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func buildViewHierarchy() {
        self.addSubview(doctorImageView)
        self.addSubview(doctorNameLabel)
        self.addSubview(doctorIdLabel)
        self.addSubview(clinicLabel)
        self.addSubview(clinicNameLabel)
        self.addSubview(division)
        self.addSubview(specialityLabel)
        self.addSubview(specialityNameLabel)
    }

    // MARK: setupStyle Functions
    func setupAdditionalConfiguration() {
        setupStyles()
    }

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
    func setupContraints() {
        setupDoctorImageViewConstraints()
        setupDoctorNameLabelConstraints()
        setupDoctorIdLabelConstraints()
        setupClinicLabelConstraints()
        setupClinicNameLabelConstraints()
        setupDivisionConstraints()
        setupSpecialityLabelConstraints()
        setupSpecialityNameLabelConstraints()
    }

    private func setupDoctorImageViewConstraints() {
        self.doctorImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.doctorImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            self.doctorImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.doctorImageView.widthAnchor.constraint(equalToConstant: 56),
            self.doctorImageView.heightAnchor.constraint(equalToConstant: 56)
        ])
    }

    private func setupDoctorNameLabelConstraints() {
        self.addSubview(doctorNameLabel)
        self.doctorNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.doctorNameLabel.topAnchor.constraint(equalTo: doctorImageView.bottomAnchor, constant: 4),
            self.doctorNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }

    private func setupDoctorIdLabelConstraints() {
        self.doctorIdLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.doctorIdLabel.topAnchor.constraint(equalTo: doctorNameLabel.bottomAnchor, constant: 4),
            self.doctorIdLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }

    private func setupClinicLabelConstraints() {
        self.clinicLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.clinicLabel.topAnchor.constraint(equalTo: doctorIdLabel.bottomAnchor, constant: 24),
            self.clinicLabel.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor)
        ])
    }

    private func setupClinicNameLabelConstraints() {
        self.clinicNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.clinicNameLabel.topAnchor.constraint(equalTo: clinicLabel.topAnchor),
            self.clinicNameLabel.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor)
        ])
    }

    private func setupDivisionConstraints() {
        self.division.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            division.heightAnchor.constraint(equalToConstant: 0.25),
            division.topAnchor.constraint(equalTo: clinicLabel.bottomAnchor, constant: 8),
            division.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            division.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }

    private func setupSpecialityLabelConstraints() {
        self.specialityLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.specialityLabel.topAnchor.constraint(equalTo: division.bottomAnchor, constant: 7.75),
            self.specialityLabel.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor)
        ])
    }

    private func setupSpecialityNameLabelConstraints() {
        self.specialityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.specialityNameLabel.topAnchor.constraint(equalTo: specialityLabel.topAnchor),
            self.specialityNameLabel.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor)
        ])
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
