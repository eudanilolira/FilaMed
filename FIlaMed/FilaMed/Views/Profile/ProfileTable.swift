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

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupConstraints() {
        print(self.contentSize)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: superview!.subviews[0].bottomAnchor, constant: 150).isActive = true
//        self.centerXAnchor.constraint(equalTo: superview!.centerXAnchor).isActive = true
//        self.centerYAnchor.constraint(equalTo: superview!.centerYAnchor).isActive = true
//        self.heightAnchor.constraint(equalToConstant: self.contentSize.height).isActive = true
        self.heightAnchor.constraint(equalToConstant: 200).isActive = true
        self.widthAnchor.constraint(equalTo: superview!.widthAnchor).isActive = true
    }

    func setupStyle() {
        self.register(AppointmentsHeader.self, forHeaderFooterViewReuseIdentifier: "appointmentsHeader")
        self.backgroundColor = GlobalStyle.BackgroundColor
    }
}
