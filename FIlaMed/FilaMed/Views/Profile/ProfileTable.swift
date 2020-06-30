//
//  ProfileTable.swift
//  FilaMed
//
//  Created by Danilo Araújo on 29/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import UIKit

class ProfileTable: UITableView, CodeView {
    func buildViewHierarchy() {
    }

    func setupContraints() {
    }

    func setupAdditionalConfiguration() {
        self.isScrollEnabled = false
        self.backgroundColor = .white
        self.layer.cornerRadius = 10

        self.register(ProfilesHeader.self, forHeaderFooterViewReuseIdentifier: "profilesHeader")
        self.register(ProfileCell.self, forCellReuseIdentifier: "profileCell")
        self.backgroundColor = GlobalStyle.BackgroundColor
    }

    init() {
        super.init(frame: .zero, style: UITableView.Style.plain)
        self.setupView()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
