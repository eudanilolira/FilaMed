//
//  LineScrollView.swift
//  FilaMed
//
//  Created by Wilton Ramos on 29/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import UIKit

class LineScrollView: UIScrollView {

    var contentView: LineStackView = LineStackView()

    public init() {
        super.init(frame: .zero)
        self.addSubview(contentView)
        contentView.setupConstraints()
        setupStyle()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupStyle() {
        self.backgroundColor = .systemGray6
    }
}
