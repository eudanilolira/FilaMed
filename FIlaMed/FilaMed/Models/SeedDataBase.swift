//
//  SeedDataBase.swift
//  FilaMed
//
//  Created by Pedro Moura on 28/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import UIKit
import CoreData

struct SeedDataBase {
    static let shared = SeedDataBase()

    func createAppointments() {
        let today = Date()
        let appointment = AppointmentManager.shared.create(date: today)
        appointment?.realized = DoctorManager.shared.create(name: "Dra.Judith da Matta")
        appointment!.realized!.specialty = "Ortodontista"
        appointment?.to = UserManager.shared.create(name: "Danilo Araujo")

    }

    func createFutureAppointments() {
        var today = DateComponents()
        today.calendar = Calendar.current
        today.day = 10
        today.month = 10
        today.year = 2020
        print(today)
        let appointment = AppointmentManager.shared.create(date: today.date!)
        appointment?.realized = DoctorManager.shared.create(name: "Dra.Marcio Danilo")
        appointment!.realized!.specialty = "Pediatra"
        appointment?.to = UserManager.shared.create(name: "Danilo Araujo")
    }
}
