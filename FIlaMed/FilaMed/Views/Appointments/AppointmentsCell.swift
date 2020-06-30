//
//  Cells.swift
//  FilaMed
//
//  Created by Danilo Araújo on 24/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import Foundation
import UIKit

class AppointmentCell<Content: AppointmentContent>: UITableViewCell, CodeView {
    let content: Content = Content()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func buildViewHierarchy() {
        self.addSubview(content)
    }

    func setupContraints() {
        self.content.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.content.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            self.content.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            self.content.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor)
        ])
    }

    func setupAdditionalConfiguration() {
        self.backgroundColor = GlobalStyle.BackgroundColor
        self.selectionStyle = .none
    }
}
