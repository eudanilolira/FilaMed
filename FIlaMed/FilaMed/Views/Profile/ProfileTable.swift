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
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: superview!.subviews[0].bottomAnchor, constant: 150).isActive = true
        self.heightAnchor.constraint(equalToConstant: 170).isActive = true
        self.trailingAnchor.constraint(equalTo: superview!.layoutMarginsGuide.trailingAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: superview!.layoutMarginsGuide.leadingAnchor).isActive = true
    }

    func setupStyle() {
        self.register(ProfilesHeader.self, forHeaderFooterViewReuseIdentifier: "profilesHeader")
        self.register(ProfileCell.self, forCellReuseIdentifier: "profileCell")
        self.backgroundColor = GlobalStyle.BackgroundColor
    }
}

class ProfilesHeader: UITableViewHeaderFooterView {
    let view = UIView()
    let title = UILabel()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.setupStyle()
        self.setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupStyle() {
        contentView.addSubview(view)
        contentView.addSubview(title)

        title.font = UIFont.boldSystemFont(ofSize: 17)
        title.backgroundColor = GlobalStyle.BackgroundColor
        view.backgroundColor =  GlobalStyle.BackgroundColor
    }

    func setupConstraints() {
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
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)

        ])
    }
}
