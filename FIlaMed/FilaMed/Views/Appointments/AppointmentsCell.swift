//
//  Cells.swift
//  FilaMed
//
//  Created by Danilo Araújo on 24/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import Foundation
import UIKit

class AppointmentCell<Content: HaveConstraints>: UITableViewCell {
    let content: Content = Content()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(content)
        self.backgroundColor = GlobalStyle.BackgroundColor
        self.selectionStyle = .none

        content.setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

protocol HaveConstraints: UIView {
    func setupConstraints()
}
