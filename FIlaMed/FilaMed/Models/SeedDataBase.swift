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
    static var doctors: [Doctor?] = []
    static var appointments: [Appointment?] = []
    static var users: [User?] = []
    static var clinics: [Clinic] = []

    func seed() {

        if AppointmentManager.shared.count() == 0 {
            createDoctors()
            createUsers()
            createAppointments()
            createFutureAppointments()
        } else {
            if let data = DoctorManager.shared.getAll() {
                SeedDataBase.doctors = data
            }

            if let data = AppointmentManager.shared.getAll() {
                SeedDataBase.appointments = data
            }

            if let data = UserManager.shared.getAll() {
                SeedDataBase.users = data
            }

            if let data = ClinicManager.shared.getAll() {
                SeedDataBase.clinics = data
            }
        }

    }

    func createDoctors() {
        SeedDataBase.doctors = [
            DoctorManager.shared.create(name: "Dra.Judith da Matta", specialty: "Ortodontista", identifier: "125464"),
            DoctorManager.shared.create(name: "Dra.Sylvia Lira", specialty: "Ortodontista", identifier: "625464"),
            DoctorManager.shared.create(name: "Dr.Flávio Arrais", specialty: "Cardiologista", identifier: "2845679"),
            DoctorManager.shared.create(name: "Dr.João Ramos", specialty: "Psiquiatra", identifier: "7856790")
        ]
    }

    func createUsers() {
        SeedDataBase.users = [
            UserManager.shared.create(name: "Danilo Araújo"),
            UserManager.shared.create(name: "Wilton Ramos"),
            UserManager.shared.create(name: "Pedro da Matta"),
            UserManager.shared.create(name: "Hugo Santos")
        ]
    }

    func createAppointments() {
        let today = Date()

        for appoint in 0...3 {
            if let appointment = AppointmentManager.shared.create(date: today, time: "9:30", status: .line) {
                appointment.realized = SeedDataBase.doctors[appoint]
                appointment.to = SeedDataBase.users[0]

                SeedDataBase.appointments.append(appointment)
            }
        }
    }

    func createFutureAppointments() {
        var appointmentDate = DateComponents()

        appointmentDate.calendar = Calendar.current
        appointmentDate.day = 23
        appointmentDate.month = 10
        appointmentDate.year = 2020

        for appoint in 0...3 {
            if let appointment = AppointmentManager.shared.create(date: appointmentDate.date!, time: "9:30", status: .line) {
                appointment.realized = SeedDataBase.doctors[appoint]
                appointment.to = SeedDataBase.users[0]

                SeedDataBase.appointments.append(appointment)
            }

        }
    }
}
