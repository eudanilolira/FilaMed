//
//  ProfileCell.swift
//  FilaMed
//
//  Created by Danilo Araújo on 29/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import UIKit

class ProfileCell: UITableViewCell {
    let label: UILabel = UILabel()
    let accessButton: UIButton = UIButton()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupStyles()
        self.setupConstraints()
        self.selectionStyle = .none
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupConstraints() {
        self.label.translatesAutoresizingMaskIntoConstraints = false
        self.accessButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.label.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            self.label.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])

        NSLayoutConstraint.activate([
            self.accessButton.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
            self.accessButton.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }

    func setupStyles() {
        self.addSubview(label)
        self.addSubview(accessButton)

        let arrowSymbolFont = UIFont.systemFont(ofSize: 15, weight: .semibold)
        let arrowSymbolConfiguration = UIImage.SymbolConfiguration(font: arrowSymbolFont)
        let arrowSymbol = UIImage(systemName: "chevron.right", withConfiguration: arrowSymbolConfiguration)

        self.accessButton.setBackgroundImage(arrowSymbol, for: .normal)
    }

}
