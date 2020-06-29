import CoreData

struct ClinicManager {
    static let shared = ClinicManager()

    func create(name: String) -> Clinic? {

        let clinicObject = NSEntityDescription.insertNewObject(forEntityName: "Clinic", into: coreDataContext)

        guard let clinic =  clinicObject as? Clinic else {
            fatalError("Could not find Clinic class")
        }

        clinic.name = name

        return self.save() ? clinic : nil
    }

    func get(name: String) -> Clinic? {

        let fetchRequest = NSFetchRequest<Clinic>(entityName: "Clinic")
        fetchRequest.fetchLimit = 1

        do {
            let clinic = try coreDataContext.fetch(fetchRequest)
            return clinic[0]
        } catch let error {
            print("We Couldn't find the clinic. \n \(error)")
        }

        return nil
    }

    func count() -> Int {

        let fetchRequest = NSFetchRequest<Clinic>(entityName: "Clinic")

        do {
            return try coreDataContext.count(for: fetchRequest)
        } catch {
            return 0
        }
    }

    func getAll() -> [Clinic]? {

        let fetchRequest = NSFetchRequest<Clinic>(entityName: "Clinic")

        do {
            let clinics = try coreDataContext.fetch(fetchRequest)
            return clinics
        } catch {
            print("Something happened try again later.")
        }

        return nil
    }

    func delete(name: String) -> Bool {

        let fetchRequest = NSFetchRequest<Clinic>(entityName: "Clinic")

        fetchRequest.fetchLimit = 1
        fetchRequest.predicate = NSPredicate(format: "name == %@", name)

        do {
            let clinic = try coreDataContext.fetch(fetchRequest)

            if !clinic.isEmpty {
                coreDataContext.delete(clinic[0])
                return self.save()
            } else {
                print("This clinic could not be found")
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
            print("Sorry, we can't save the clinic. Try again later. \n \(error)")
        }

        return false
    }
}
