//
//  AppointmentsHeader.swift
//  FilaMed
//
//  Created by Danilo Araújo on 30/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import UIKit

class AppointmentsHeader: UITableViewHeaderFooterView, CodeView {
    let view = UIView()
    let title = UILabel()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func buildViewHierarchy() {
        contentView.addSubview(view)
        contentView.addSubview(title)
    }

    func setupContraints() {
        title.translatesAutoresizingMaskIntoConstraints = false
        view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: 30),
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            view.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])

        NSLayoutConstraint.activate([
            title.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            title.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            title.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)

        ])
    }

    func setupAdditionalConfiguration() {
        title.font = UIFont.boldSystemFont(ofSize: 22)
        title.backgroundColor = GlobalStyle.BackgroundColor
        view.backgroundColor =  GlobalStyle.BackgroundColor
    }

}
