//
//  ProfileView.swift
//  FIlaMed
//
//  Created by Danilo Araújo on 22/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import UIKit

class ProfileView: UIView, CodeView {
    let profileInfo = ProfileInfoView()
    let profileTable = ProfileTable()

    func buildViewHierarchy() {
        self.addSubview(profileInfo)
        self.addSubview(profileTable)
    }

    func setupContraints() {
        self.profileInfo.translatesAutoresizingMaskIntoConstraints = false
        self.profileTable.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.profileInfo.topAnchor.constraint(equalTo: self.topAnchor),
            self.profileInfo.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            self.profileTable.topAnchor.constraint(equalTo: self.profileInfo.bottomAnchor, constant: 240),
            self.profileTable.heightAnchor.constraint(equalToConstant: 170),
            self.profileTable.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
            self.profileTable.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor)
        ])
    }

    func setupAdditionalConfiguration() {
        self.backgroundColor = GlobalStyle.BackgroundColor
    }

    public init() {
        super.init(frame: .zero)
        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
