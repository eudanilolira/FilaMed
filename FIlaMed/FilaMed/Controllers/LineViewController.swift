//
//  LineViewController.swift
//  FIlaMed
//
//  Created by Danilo Araújo on 22/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import UIKit

class LineViewController: UIViewController {

    let lineScrollView = LineScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.view = self.lineScrollView
        NSLayoutConstraint.activate([
            self.lineScrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.lineScrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.lineScrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.lineScrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])

    }

    override func viewWillAppear(_ animated: Bool) {
        self.title = "Fila"
    }
}
