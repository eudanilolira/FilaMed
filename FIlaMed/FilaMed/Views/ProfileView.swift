//
//  ProfileView.swift
//  FIlaMed
//
//  Created by Danilo Araújo on 22/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import UIKit

class ProfileView: UIView {
    let profilePicture = ProfilePicture()
    public init() {
        super.init(frame: .zero)
        self.backgroundColor = GlobalStyle.BackgroundColor
        self.addSubview(profilePicture)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

class ProfilePicture: UIImageView {
    public init() {
        super.init(frame: CGRect(x: 200, y: 100, width: 60, height: 60))
        self.setupLayout()
//        self.setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupLayout() {
        let picture = UIImage(named: "profile_picture.png")
        self.image = picture
    }

    func setupConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
//            self.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
