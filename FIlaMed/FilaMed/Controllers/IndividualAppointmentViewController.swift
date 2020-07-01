//
//  IndividualAppointmentViewController.swift
//  FIlaMed
//
//  Created by Danilo Araújo on 22/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import UIKit

class IndividualAppointmentViewController: UIViewController {
    var stackView = IndividualAppointmentView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = stackView
    }

}
