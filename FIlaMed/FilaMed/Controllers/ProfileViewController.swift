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
//        self.modalPresentationStyle = UIModalPresentationStyle.currentContext
//        definesPresentationContext = true
        self.view = self.profileView
    }

}
