//
//  IndividualAppointmentClinicInformation.swift
//  FilaMed
//
//  Created by Pedro Moura on 01/07/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import UIKit
import MapKit

class IndividualAppointmentClinicInformation: UIView, CodeView, MKMapViewDelegate {
    let clinicName = UILabel()
    let specialty = UILabel()
    let address = UILabel()
    var maps = MKMapView()
    let division = UIView()

    public init() {
        super.init(frame: .zero)
        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func buildViewHierarchy() {
        self.addSubview(clinicName)
        self.addSubview(specialty)
        self.addSubview(address)
        self.addSubview(division)
        self.addSubview(maps)
    }

    func setupContraints() {
        self.clinicName.translatesAutoresizingMaskIntoConstraints = false
        self.specialty.translatesAutoresizingMaskIntoConstraints = false
        self.address.translatesAutoresizingMaskIntoConstraints = false
        self.division.translatesAutoresizingMaskIntoConstraints = false
        self.maps.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.clinicName.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            self.clinicName.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor),

            self.specialty.topAnchor.constraint(equalTo: self.clinicName.bottomAnchor, constant: 5),
            self.specialty.leadingAnchor.constraint(equalTo: self.clinicName.leadingAnchor),

            self.address.topAnchor.constraint(equalTo: self.specialty.bottomAnchor),
            self.address.leadingAnchor.constraint(equalTo: self.clinicName.leadingAnchor),

            self.division.heightAnchor.constraint(equalToConstant: 0.25),
            self.division.topAnchor.constraint(equalTo: self.specialty.bottomAnchor, constant: 20),
            self.division.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            self.division.trailingAnchor.constraint(equalTo: self.trailingAnchor),

            self.maps.topAnchor.constraint(equalTo: self.division.bottomAnchor, constant: 10),
            self.maps.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.maps.heightAnchor.constraint(equalToConstant: 165),
            self.maps.widthAnchor.constraint(equalToConstant: 360)
        ])
    }

    func setupAdditionalConfiguration() {

        self.backgroundColor = .white
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 10

        self.specialty.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.address.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)

        self.division.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)

        // Fonts configurations
        self.clinicName.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        self.specialty.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        self.address.font = UIFont.systemFont(ofSize: 15, weight: .regular)

        // Maps configuration
        let clinicCordinate = MKPointAnnotation()
        clinicCordinate.coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(integerLiteral: -12.15487600),
                                                            longitude: CLLocationDegrees(integerLiteral: -44.99426600))
        self.maps.addAnnotation(clinicCordinate)

        let regionRadius = CLLocationDistance(50)
        let cordinateRegion = MKCoordinateRegion(center: clinicCordinate.coordinate, latitudinalMeters: regionRadius*2.0, longitudinalMeters: regionRadius*2.0)
        self.maps.setRegion(cordinateRegion, animated: true)

        self.maps.showsBuildings = true
        self.maps.pointOfInterestFilter = .some(MKPointOfInterestFilter(excluding: []))
        self.maps.layer.cornerRadius = 10

        self.maps.delegate = self
    }

}
