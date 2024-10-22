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
    static var clinics: [Clinic?] = []

    func seed() {
        if let data = DoctorManager.shared.getAll() {
            SeedDataBase.doctors = data.isEmpty ? SeedDataBase.shared.createDoctors() : data
        }

        if let data = ClinicManager.shared.getAll() {
            SeedDataBase.clinics = data.isEmpty ? SeedDataBase.shared.createClinics() : data
        }

        for doctor in SeedDataBase.doctors {
            let list = SeedDataBase.clinics
            let clinic = Int.random(in: ClosedRange(uncheckedBounds: (0, list.count-1)))
            doctor?.works = list[clinic]
        }
    }

    func createDoctors() -> [Doctor?] {
        return [
            DoctorManager.shared.create(name: "Dra.Judith da Matta", specialty: "Ortodontista", identifier: "125464"),
            DoctorManager.shared.create(name: "Dra.Sylvia Lira", specialty: "Ortodontista", identifier: "625464"),
            DoctorManager.shared.create(name: "Dr.Flávio Arrais", specialty: "Cardiologista", identifier: "2845679"),
            DoctorManager.shared.create(name: "Dr.João Ramos", specialty: "Psiquiatra", identifier: "7856790"),
            DoctorManager.shared.create(name: "Dr.Cléber Santos", specialty: "Neurologista", identifier: "7789790")
        ]
    }

    func createClinics() -> [Clinic?] {
        return [
            ClinicManager.shared.create(name: "Clínica Sorriso", address: "Rua joão ramos, 45"),
            ClinicManager.shared.create(name: "Clínica Coração", address: "Rua joão ramos, 160"),
            ClinicManager.shared.create(name: "Hope", address: "R. Padre Carapuceiro, 777")
        ]
    }

    func createAppointments(user: User) {
        let today = Date()

        var appointmentDate = DateComponents()

        appointmentDate.calendar = Calendar.current
        appointmentDate.day = 23
        appointmentDate.month = 10
        appointmentDate.year = 2020

        for index in 0...SeedDataBase.doctors.count-1 {
            if let appointment = AppointmentManager.shared.create(
                date: index%2 == 0 ? appointmentDate.date! : today,
                time: "\(index+9):30",
                status: .line) {

                appointment.realized = SeedDataBase.doctors[index]
                appointment.to = user

                SeedDataBase.appointments.append(appointment)
            }
        }
    }
}
