import CoreData
import UIKit

struct DoctorManager {
    static let shared = DoctorManager()

    func create(name: String, specialty: String, identifier: String) -> Doctor? {
        let doctorObject = NSEntityDescription.insertNewObject(forEntityName: "Doctor", into: coreDataContext)

        guard let doctor =  doctorObject as? Doctor else {
            fatalError("Could not find Doctor class")
        }

        doctor.name = name
        doctor.identifier = identifier
        doctor.specialty = specialty

        return self.save() ? doctor : nil
    }

    func get(name: String) -> Doctor? {

        let fetchRequest = NSFetchRequest<Doctor>(entityName: "Doctor")
        fetchRequest.fetchLimit = 1

        do {
            let doctor = try coreDataContext.fetch(fetchRequest)
            return doctor[0]
        } catch let error {
            print("We Couldn't find the doctor. \n \(error)")
        }

        return nil
    }

    func count() -> Int {

        let fetchRequest = NSFetchRequest<Doctor>(entityName: "Doctor")

        do {
            return try coreDataContext.count(for: fetchRequest)
        } catch {
            return 0
        }
    }

    func getAll() -> [Doctor]? {

        let fetchRequest = NSFetchRequest<Doctor>(entityName: "Doctor")

        do {
            let doctors = try coreDataContext.fetch(fetchRequest)
            return doctors
        } catch {
            print("Something happened try again later.")
        }

        return nil
    }

    func delete(name: String) -> Bool {

        let fetchRequest = NSFetchRequest<Doctor>(entityName: "Doctor")

        fetchRequest.fetchLimit = 1
        fetchRequest.predicate = NSPredicate(format: "name == %@", name)

        do {
            let doctor = try coreDataContext.fetch(fetchRequest)

            if !doctor.isEmpty {
                coreDataContext.delete(doctor[0])
                return self.save()
            } else {
                print("This doctor could not be found")
            }

        } catch {
            print("Error")
        }

        return false
    }

    func save() -> Bool {
        do {
            try coreDataContext.save()
            return true
        } catch let error {
            print("Sorry, we can't save the doctor's information. Try again later. \n \(error)")
        }

        return false
    }
}
