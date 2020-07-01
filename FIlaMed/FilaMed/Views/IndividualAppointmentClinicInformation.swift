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

        self.clinicName.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor).isActive = true
        self.clinicName.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor).isActive = true

        self.specialty.topAnchor.constraint(equalTo: self.clinicName.bottomAnchor, constant: 5).isActive = true
        self.specialty.leadingAnchor.constraint(equalTo: self.clinicName.leadingAnchor).isActive = true

        self.address.topAnchor.constraint(equalTo: self.specialty.bottomAnchor).isActive = true
        self.address.leadingAnchor.constraint(equalTo: self.clinicName.leadingAnchor).isActive = true

        self.division.heightAnchor.constraint(equalToConstant: 0.25).isActive = true
        self.division.topAnchor.constraint(equalTo: self.specialty.bottomAnchor, constant: 20).isActive = true
        self.division.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor).isActive = true
        self.division.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true

        self.maps.topAnchor.constraint(equalTo: self.division.bottomAnchor, constant: 10).isActive = true
        self.maps.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.maps.heightAnchor.constraint(equalToConstant: 165).isActive = true
        self.maps.widthAnchor.constraint(equalToConstant: 360).isActive = true

    }

    func setupAdditionalConfiguration() {

        self.backgroundColor = .white
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 10

        self.clinicName.text = "Clinica Sorriso"
        self.specialty.text = "Dentista"
        self.address.text = "Rua Guarujá, 729"

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
