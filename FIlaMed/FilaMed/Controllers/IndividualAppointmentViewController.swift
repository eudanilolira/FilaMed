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

    override func viewWillAppear(_ animated: Bool) {
        self.title = "Hoje"
        self.navigationItem.largeTitleDisplayMode = .never
        let callButton = UIBarButtonItem(image: UIImage(systemName: "phone"), style: .plain, target: self, action: #selector(self.callClinic(_:)))
        self.navigationItem.rightBarButtonItem = callButton
    }

    @objc func callClinic(_ sender: UIBarButtonItem) {
        print("Calling...")
    }
}
