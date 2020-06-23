//
//  AppointmentsViewController.swift
//  FIlaMed
//
//  Created by Danilo Araújo on 22/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import UIKit

class AppointmentsViewController: UIViewController {
    
    let appointmentsView = AppointmentsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = self.appointmentsView
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.appointmentsView.appointmentsTable.dataSource = self
        self.appointmentsView.appointmentsTable.delegate = self
    }
}

extension AppointmentsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "appointmentCell") as! AppointmentCell
        
        cell.clinicName.text = "Dra.Judith da Matta"
        cell.specialty.text = "Ortodontista"
        cell.time.text = "10:30"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:"appointmentsHeader") as! AppointmentsHeader
        view.title.text = section == 0 ? "Hoje" : "Próximas"

        return view
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
}
