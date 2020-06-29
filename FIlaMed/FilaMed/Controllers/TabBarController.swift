//
//  TabBarController.swift
//  FIlaMed
//
//  Created by Wilton Ramos on 22/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    let appointmentsController = UINavigationController(rootViewController: AppointmentsViewController())
    let lineController = UINavigationController(rootViewController: LineViewController())

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewControllers = [appointmentsController, lineController]
        setupAppointmentsTabBarItem()
        setupLineTabBarItem()
    }

    func setupAppointmentsTabBarItem() {
        appointmentsController.title = "Consultas"
        let appointmentsItemImage = UIImage(systemName: "heart.circle.fill")
        appointmentsController.tabBarItem.image = appointmentsItemImage
    }

    func setupLineTabBarItem() {
        lineController.title = "Fila"
        let lineItemImage = UIImage(systemName: "person.2")
        lineController.tabBarItem.image = lineItemImage
    }
}
