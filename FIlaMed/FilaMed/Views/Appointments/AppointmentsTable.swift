//
//  AppointmentsTable.swift
//  FilaMed
//
//  Created by Danilo Araújo on 24/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import Foundation
import UIKit

class AppointmentsTable: UITableView {

    init() {
        super.init(frame: .zero, style: UITableView.Style.plain)
        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupView() {
        self.setupStyle()
        self.setupTable()
    }

    func setupStyle() {
        self.layer.cornerRadius = 8
        self.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.backgroundColor = GlobalStyle.BackgroundColor
    }

    func setupTable() {
        self.register(AppointmentsHeader.self, forHeaderFooterViewReuseIdentifier: "appointmentsHeader")
        self.register(AppointmentCell<TodayAppointmentContent>.self, forCellReuseIdentifier: "appointmentCell")
        self.register(AppointmentCell<FutureAppointmentContent>.self, forCellReuseIdentifier: "futureAppointmentCell")
    }
}
