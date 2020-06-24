//
//  AppointmentsContent.swift
//  FilaMed
//
//  Created by Danilo Araújo on 24/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import Foundation
import UIKit


class AppointmentContent: UIView, HaveConstraints {
    let clinicName: UILabel = UILabel()
    let specialty: UILabel = UILabel()
    let time: UILabel = UILabel()
    let division: UIView = UIView()
    let accessAppointment: UIButton = UIButton()
    
    public init() {
        super.init(frame: .zero)
        
        self.layer.cornerRadius = 8
        self.backgroundColor = GlobalStyle.CardBackgroundColor
        
        self.addSubview(self.clinicName)
        self.addSubview(self.specialty)
        self.addSubview(self.time)
        self.addSubview(self.division)
        self.addSubview(self.accessAppointment)
        
        self.setupStyles()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.accessAppointment.translatesAutoresizingMaskIntoConstraints = false
        self.clinicName.translatesAutoresizingMaskIntoConstraints = false
        self.specialty.translatesAutoresizingMaskIntoConstraints = false
        self.time.translatesAutoresizingMaskIntoConstraints = false
        self.division.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: superview!.topAnchor, constant: 16),
            self.leadingAnchor.constraint(equalTo: superview!.layoutMarginsGuide.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: superview!.layoutMarginsGuide.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            clinicName.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            clinicName.topAnchor.constraint(equalTo: self.topAnchor, constant: 5)
        ])
        
        NSLayoutConstraint.activate([
            specialty.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            specialty.topAnchor.constraint(equalTo: clinicName.topAnchor, constant: 26)
        ])
        
        NSLayoutConstraint.activate([
            accessAppointment.topAnchor.constraint(equalTo: clinicName.topAnchor),
            accessAppointment.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
        ])
        
        NSLayoutConstraint.activate([
            division.heightAnchor.constraint(equalToConstant: 1),
            division.topAnchor.constraint(equalTo: specialty.topAnchor, constant: 23),
            division.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            division.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    func setupStyles(){
        self.division.backgroundColor = .gray
        
        let ultraLightConfiguration = UIImage.SymbolConfiguration(weight: .regular)
        let ultraLightSymbolImage = UIImage(systemName: "chevron.right", withConfiguration: ultraLightConfiguration)
        
        self.accessAppointment.setBackgroundImage(ultraLightSymbolImage, for: .normal)
        self.accessAppointment.setTitleColor(.blue, for: .normal)
        
        self.clinicName.font = UIFont.boldSystemFont(ofSize: 17)
        self.specialty.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.light)
    }
}


class TodayAppointmentContent: AppointmentContent {
    let statusLabel: UILabel = UILabel()
    
    override public init() {
        super.init()
        self.addSubview(self.statusLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        self.heightAnchor.constraint(equalToConstant: 88).isActive = true
        self.statusLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            statusLabel.topAnchor.constraint(equalTo: self.division.topAnchor, constant: 8),
            statusLabel.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            statusLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            time.topAnchor.constraint(equalTo: clinicName.topAnchor),
            time.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -20),
        ])
    }
    
    override func setupStyles(){
        super.setupStyles()
    }
}

class FutureAppointmentContent: AppointmentContent {
    let dateLabel: UILabel = UILabel()
    
    override public init() {
        super.init()
        self.addSubview(self.dateLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        self.heightAnchor.constraint(equalToConstant: 104).isActive = true
        self.dateLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: self.division.topAnchor, constant: 8),
            dateLabel.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            time.topAnchor.constraint(equalTo: dateLabel.topAnchor, constant: 20),
            time.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
        ])
    }
    
    override func setupStyles(){
        super.setupStyles()
    }
}
