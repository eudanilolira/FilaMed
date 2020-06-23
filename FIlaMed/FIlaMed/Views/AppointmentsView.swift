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
        self.addSubview(self.appointmentsTable)
        self.appointmentsTable.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

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
        self.register(AppointmentCell.self, forCellReuseIdentifier: "appointmentCell") //We may use more than one type of cell.
        self.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.rowHeight = 104
        self.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
    }
}

class AppointmentCell: UITableViewCell {
    let content: AppointmentContent = AppointmentContent()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(content)
        content.setupConstraints()
        self.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
        content.backgroundColor = .white
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

class AppointmentContent: UIView {
    let clinicName: UILabel = UILabel()
    let specialty: UILabel = UILabel()
    let time: UILabel = UILabel()
    let division: UIView = UIView()
    
    public init() {
        super.init(frame: .zero)
        

        self.layer.cornerRadius = 8
        self.backgroundColor = .clear
        
        
        self.addSubview(self.clinicName)
        self.addSubview(self.specialty)
        self.addSubview(self.time)
        self.addSubview(self.division)
        
        self.setupStyles()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        self.clinicName.translatesAutoresizingMaskIntoConstraints = false
        self.specialty.translatesAutoresizingMaskIntoConstraints = false
        self.time.translatesAutoresizingMaskIntoConstraints = false
        self.division.translatesAutoresizingMaskIntoConstraints = false
        self.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 88),
            self.topAnchor.constraint(equalTo: specialty.bottomAnchor),
            self.leadingAnchor.constraint(equalTo: superview!.layoutMarginsGuide.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: superview!.layoutMarginsGuide.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            clinicName.heightAnchor.constraint(equalToConstant: 30),
            clinicName.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            clinicName.topAnchor.constraint(equalTo: self.topAnchor, constant: 5)
        ])
        
        NSLayoutConstraint.activate([
            specialty.heightAnchor.constraint(equalToConstant: 30),
            specialty.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            specialty.topAnchor.constraint(equalTo: clinicName.topAnchor, constant: 26)
        ])
        
        NSLayoutConstraint.activate([
            time.heightAnchor.constraint(equalToConstant: 30),
            time.topAnchor.constraint(equalTo: clinicName.topAnchor),
            time.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            division.heightAnchor.constraint(equalToConstant: 1),
            division.topAnchor.constraint(equalTo: specialty.bottomAnchor),
            division.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            division.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        
    }
    
    //We need to correct the fonts
    func setupStyles(){
        self.division.backgroundColor = .gray
        
        self.clinicName.font = UIFont.boldSystemFont(ofSize: 17)
        self.specialty.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.light)
    }
}

//Remove view behind UILabel
class AppointmentsHeader: UITableViewHeaderFooterView {
    let view = UIView()
    let title = UILabel()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureContents() {
        contentView.addSubview(view)
        view.addSubview(title)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        view.translatesAutoresizingMaskIntoConstraints = false
        
        title.font = UIFont.boldSystemFont(ofSize: 22)
        title.backgroundColor = .red
        view.backgroundColor = .blue

        NSLayoutConstraint.activate([
//            view.heightAnchor.constraint(equalToConstant: 50),
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            view.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            view.topAnchor.constraint(equalTo: contentView.topAnchor)
//            title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
        
        NSLayoutConstraint.activate([
//            title.heightAnchor.constraint(equalToConstant: 30),
            title.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            title.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            title.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            
        ])
    }
}
