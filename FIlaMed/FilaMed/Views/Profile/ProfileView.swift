//
//  ProfileView.swift
//  FIlaMed
//
//  Created by Danilo Araújo on 22/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import UIKit

class ProfileView: UIView {
    let profileInfo = ProfileInfoView()
    let profileTable = ProfileTable()

    public init() {
        super.init(frame: .zero)
        self.backgroundColor = GlobalStyle.BackgroundColor
        self.addSubview(profileInfo)
        self.addSubview(profileTable)
        self.profileInfo.setupConstraints()
        self.profileTable.setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

class ProfileInfoView: UIView {
    let profilePicture: UIImageView = UIImageView()
    let profileName: UILabel = UILabel()

    public init() {
        super.init(frame: .zero)
        self.setupLayout()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupLayout() {
        self.addSubview(profilePicture)
        self.addSubview(profileName)

        let picture = UIImage(named: "profile_picture.png")
        self.profilePicture.image = picture

        let font = UIFont.systemFont(ofSize: 22, weight: .bold)

        self.profileName.font = font
        self.profileName.text = "Pedro da Matta"
        self.profileName.sizeToFit()
    }

    func setupConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.profileName.translatesAutoresizingMaskIntoConstraints = false
        self.profilePicture.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: superview!.topAnchor, constant: 80),
            self.centerXAnchor.constraint(equalTo: superview!.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            self.profilePicture.topAnchor.constraint(equalTo: superview!.topAnchor, constant: 100),
            self.profilePicture.centerXAnchor.constraint(equalTo: superview!.centerXAnchor),
            self.profilePicture.heightAnchor.constraint(equalToConstant: 74),
            self.profilePicture.widthAnchor.constraint(equalToConstant: 74)
        ])

        NSLayoutConstraint.activate([
            self.profileName.topAnchor.constraint(equalTo: profilePicture.bottomAnchor, constant: 16),
            self.profileName.centerXAnchor.constraint(equalTo: profilePicture.centerXAnchor)
        ])

    }
}
