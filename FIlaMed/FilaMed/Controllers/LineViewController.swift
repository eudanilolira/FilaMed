//
//  LineViewController.swift
//  FIlaMed
//
//  Created by Danilo Araújo on 22/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import UIKit

class LineViewController: UIViewController, CodeView {

    let rootView: UIView = UIView()
    let contentView: LineScrollView = LineScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.view = self.rootView
        setupView()
    }

    func buildViewHierarchy() {
        self.view.addSubview(contentView)
    }

    func setupContraints() {
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.contentView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.contentView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.contentView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.contentView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }

    func setupAdditionalConfiguration() {
        self.title = "Fila"
    }
}
