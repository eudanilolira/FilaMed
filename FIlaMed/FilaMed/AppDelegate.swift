//
//  AppDelegate.swift
//  FIlaMed
//
//  Created by Danilo Araújo on 19/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let appointmentsViewControler = AppointmentsViewController()
        let lineViewController = LineViewController()

        appointmentsViewControler.title = "Consultas"
        lineViewController.title = "Fila"

        let appointmentsItemImage = UIImage(systemName: "heart.circle.fill")
        let lineItemImage = UIImage(systemName: "person")
        appointmentsViewControler.tabBarItem.image = appointmentsItemImage
        lineViewController.tabBarItem.image = lineItemImage

        let appointmentNavigationController = UINavigationController(rootViewController: appointmentsViewControler)
        let lineNavigationController = UINavigationController(rootViewController: lineViewController)

        let tabBarControler = UITabBarController()
        tabBarControler.viewControllers = [appointmentNavigationController, lineNavigationController]

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        window?.rootViewController = tabBarControler

        return true
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentCloudKitContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentCloudKitContainer(name: "FIlaMed")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {

                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {

                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}
