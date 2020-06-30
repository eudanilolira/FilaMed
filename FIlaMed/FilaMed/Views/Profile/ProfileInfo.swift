//
//  ProfileInfoView.swift
//  FilaMed
//
//  Created by Danilo Araújo on 30/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//
import UIKit

class ProfileInfoView: UIView, CodeView {
    let profilePicture: UIImageView = UIImageView()
    let profileName: UILabel = UILabel()

    public init() {
        super.init(frame: .zero)
        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func buildViewHierarchy() {
        self.addSubview(profilePicture)
        self.addSubview(profileName)
    }

    func setupContraints() {
        self.profileName.translatesAutoresizingMaskIntoConstraints = false
        self.profilePicture.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.profilePicture.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            self.profilePicture.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.profilePicture.heightAnchor.constraint(equalToConstant: 74),
            self.profilePicture.widthAnchor.constraint(equalToConstant: 74)
        ])

        NSLayoutConstraint.activate([
            self.profileName.topAnchor.constraint(equalTo: profilePicture.bottomAnchor, constant: 16),
            self.profileName.centerXAnchor.constraint(equalTo: profilePicture.centerXAnchor)
        ])
    }

    func setupAdditionalConfiguration() {
        let picture = UIImage(named: "profile_picture.png")
        self.profilePicture.image = picture

        let font = UIFont.systemFont(ofSize: 22, weight: .bold)

        self.profileName.font = font
        self.profileName.text = "Pedro da Matta"
        self.profileName.sizeToFit()
    }
}
