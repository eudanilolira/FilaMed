//
//  ProfileViewController.swift
//  FIlaMed
//
//  Created by Danilo Araújo on 22/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    let profileView = ProfileView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = self.profileView
        let okButton = UIBarButtonItem(title: "OK", style: .done, target: self, action: #selector(self.dismissProfileView(_:)))
        self.navigationItem.rightBarButtonItem = okButton

        self.profileView.profileTable.dataSource = self
        self.profileView.profileTable.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        self.presentationController?.containerView?.backgroundColor = GlobalStyle.BackgroundColor
    }

    @objc func dismissProfileView(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }

}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let profileCell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath)

        guard let cell = profileCell as? ProfileCell else {
            fatalError("")
        }

        switch indexPath.row {
        case 0:
            cell.label.text = "Plano de Saúde"
        case 1:
            cell.label.text = "Dados pessoais"
        default:
            cell.label.text = "Histórico de consultas"
        }

        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let viewHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: "profilesHeader")

        guard let view = viewHeader as? ProfilesHeader else {
            fatalError("Cannot found ProfilesHeader")
        }
        view.title.text = "Conta"

        return view
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
