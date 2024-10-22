import CoreData

struct UserManager {
    static let shared = UserManager()
    static var loggedUser: User?

    func create(name: String, email: String) -> User? {

        let userObject = NSEntityDescription.insertNewObject(forEntityName: "User", into: coreDataContext)

        guard let user =  userObject as? User else {
            fatalError("Could not find User class")
        }

        user.name = name
        user.email = email

        return self.save() ? user : nil
    }

    func get(email: String) -> User? {

        let fetchRequest = NSFetchRequest<User>(entityName: "User")
        fetchRequest.fetchLimit = 1
        fetchRequest.predicate = NSPredicate(format: "email == %@", email)

        do {
            let user = try coreDataContext.fetch(fetchRequest)
            if !user.isEmpty { return user[0] }
        } catch let error {
            print("We Couldn't find the user. \n \(error)")
        }

        return nil
    }

    func count() -> Int {

        let fetchRequest = NSFetchRequest<User>(entityName: "User")

        do {
            return try coreDataContext.count(for: fetchRequest)
        } catch {
            return 0
        }
    }

    func getAll() -> [User]? {

        let fetchRequest = NSFetchRequest<User>(entityName: "User")

        do {
            let users = try coreDataContext.fetch(fetchRequest)
            return users
        } catch {
            print("Something happened try again later.")
        }

        return nil
    }

    func delete(name: String) -> Bool {

        let fetchRequest = NSFetchRequest<User>(entityName: "User")

        fetchRequest.fetchLimit = 1
        fetchRequest.predicate = NSPredicate(format: "name == %@", name)

        do {
            let user = try coreDataContext.fetch(fetchRequest)

            if !user.isEmpty {
                coreDataContext.delete(user[0])
                return self.save()
            } else {
                print("This user could not be found")
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
            print("Sorry, we can't save the user. Try again later. \n \(error)")
        }

        return false
    }
}
