import CoreData

struct ConsultManager {
    static let shared = ConsultManager()

    func create(name: String) -> Consult? {
        let consultObject = NSEntityDescription.insertNewObject(forEntityName: "Consult", into: coreDataContext)

        guard let consult =  consultObject as? Consult else {
            fatalError("Could not find Consult class")
        }

        return self.save() ? consult : nil
    }

    func get(name: String) -> Consult? {
        let fetchRequest = NSFetchRequest<Consult>(entityName: "Consult")
        fetchRequest.fetchLimit = 1

        do {
            let consult = try coreDataContext.fetch(fetchRequest)
            return consult[0]
        } catch let error {
            print("We Couldn't find the consult. \n \(error)")
        }

        return nil
    }

    func count() -> Int {
        let fetchRequest = NSFetchRequest<Consult>(entityName: "Consult")

        do {
            return try coreDataContext.count(for: fetchRequest)
        } catch {
            return 0
        }
    }

    func getAll() -> [Consult]? {
        let fetchRequest = NSFetchRequest<Consult>(entityName: "Consult")

        do {
            let consults = try coreDataContext.fetch(fetchRequest)
            return consults
        } catch {
            print("Something happened try again later.")
        }

        return nil
    }

    func delete(name: String) -> Bool {
        let fetchRequest = NSFetchRequest<Consult>(entityName: "Consult")

        fetchRequest.fetchLimit = 1
        fetchRequest.predicate = NSPredicate(format: "name == %@", name)

        do {
            let consult = try coreDataContext.fetch(fetchRequest)

            if !consult.isEmpty {
                coreDataContext.delete(consult[0])
                return self.save()
            } else {
                print("This consult could not be found")
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
            print("Sorry, we can't save the consult. Try again later. \n \(error)")
        }

        return false
    }
}
