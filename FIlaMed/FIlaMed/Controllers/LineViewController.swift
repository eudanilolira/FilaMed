//
//  LineViewController.swift
//  FIlaMed
//
//  Created by Danilo Araújo on 22/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import UIKit

class LineViewController: UIViewController {
    
    let lineView = LineView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        //lineView.setupConstraints()
        self.view = self.lineView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = "Fila"
    }

}
