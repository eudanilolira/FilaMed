//
//  TabBarController.swift
//  FIlaMed
//
//  Created by Wilton Ramos on 22/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let appointmentsViewController = self.setupAppointmentsVC()
        let lineViewController = self.setupLineVC()

        self.viewControllers = [appointmentsViewController, lineViewController]
    }

    func setupAppointmentsVC() -> UINavigationController {
        let appointmentsViewController = AppointmentsViewController()
        let navigationController = UINavigationController(rootViewController: appointmentsViewController)
        appointmentsViewController.title = "Consultas"
        let appointmentsItemImage = UIImage(systemName: "heart.circle.fill")
        appointmentsViewController.tabBarItem.image = appointmentsItemImage

        return navigationController
    }

    func setupLineVC() -> UINavigationController {
        let lineViewController = LineViewController()
        let navigationController = UINavigationController(rootViewController: lineViewController)
        lineViewController.title = "Fila"
        let lineItemImage = UIImage(systemName: "person.2")
        lineViewController.tabBarItem.image = lineItemImage

        return navigationController
    }
}
