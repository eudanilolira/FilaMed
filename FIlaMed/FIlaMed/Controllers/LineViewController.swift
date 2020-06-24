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
        //lineView.setupConstraints()
        self.view = self.lineScrollView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = "Fila"
    }

}
