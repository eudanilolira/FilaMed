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
        self.setupStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints(){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: superview!.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: superview!.centerYAnchor).isActive = true
        self.heightAnchor.constraint(equalTo: superview!.heightAnchor).isActive = true
        self.widthAnchor.constraint(equalTo: superview!.widthAnchor).isActive = true
    }
    
    func setupStyle() {
        self.register(AppointmentsHeader.self, forHeaderFooterViewReuseIdentifier: "appointmentsHeader")
        self.register(AppointmentCell<TodayAppointmentContent>.self, forCellReuseIdentifier: "appointmentCell")
        self.register(AppointmentCell<FutureAppointmentContent>.self, forCellReuseIdentifier: "futureAppointmentCell")
        self.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.backgroundColor = GlobalStyle.BackgroundColor
    }
}



class AppointmentsHeader: UITableViewHeaderFooterView {
    let view = UIView()
    let title = UILabel()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.setupStyle()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupStyle() {
        contentView.addSubview(view)
        contentView.addSubview(title)
        
        title.font = UIFont.boldSystemFont(ofSize: 22)
        title.backgroundColor = GlobalStyle.BackgroundColor
        view.backgroundColor =  GlobalStyle.BackgroundColor
    }
    
    func setupConstraints(){
        title.translatesAutoresizingMaskIntoConstraints = false
        view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: 30),
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            view.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
        
        NSLayoutConstraint.activate([
            title.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            title.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            title.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            
        ])
    }
}
