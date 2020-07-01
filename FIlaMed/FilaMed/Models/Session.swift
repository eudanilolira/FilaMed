//
//  Session.swift
//  FilaMed
//
//  Created by Danilo Araújo on 01/07/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import Foundation
import FirebaseAuth

class SessionManager {
    static let shared = SessionManager()
    static var user: User?

    func login(_ user: FirebaseAuth.User) {
        let loggedUser = UserManager.shared.get(email: user.email!)
        SessionManager.user = loggedUser
    }

    func logout() {

    }

    func isLogged() -> Bool {
        guard let _ = Auth.auth().currentUser else { return false }
        guard let _ = SessionManager.user else { return false}

        return true
    }

}
