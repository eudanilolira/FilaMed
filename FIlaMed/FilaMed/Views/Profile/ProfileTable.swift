//
//  ProfileTable.swift
//  FilaMed
//
//  Created by Danilo Araújo on 29/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import UIKit

class ProfileTable: UITableView {

    init() {
        super.init(frame: .zero, style: UITableView.Style.plain)
        self.setupStyle()
        self.isScrollEnabled = false

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: superview!.subviews[0].bottomAnchor, constant: 150).isActive = true
        self.heightAnchor.constraint(equalToConstant: 200).isActive = true
        self.widthAnchor.constraint(equalTo: superview!.widthAnchor).isActive = true
    }

    func setupStyle() {
        self.register(AppointmentsHeader.self, forHeaderFooterViewReuseIdentifier: "appointmentsHeader")
        self.register(ProfileCell.self, forCellReuseIdentifier: "profileCell")
        self.backgroundColor = GlobalStyle.BackgroundColor
    }
}
