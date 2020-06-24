//
//  AppointmentsView.swift
//  FIlaMed
//
//  Created by Danilo Araújo on 22/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//
import UIKit

class AppointmentsView: UIView {
    
    let appointmentsTable: AppointmentsTable = AppointmentsTable()
    
    public init() {
        super.init(frame: .zero)
        self.setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        self.addSubview(self.appointmentsTable)
        self.appointmentsTable.setupConstraints()
    }
}
