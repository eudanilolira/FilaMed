//
//  ProfileViewController.swift
//  FIlaMed
//
//  Created by Danilo Araújo on 22/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    let profileView = ProfileView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = self.profileView
        let okButton = UIBarButtonItem(title: "OK", style: .done, target: self, action: #selector(self.dismissProfileView(_:)))
        self.navigationItem.rightBarButtonItem = okButton
    }

    override func viewWillAppear(_ animated: Bool) {
        self.presentationController?.containerView?.backgroundColor = GlobalStyle.BackgroundColor
    }

    @objc func dismissProfileView(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }

}
