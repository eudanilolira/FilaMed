//
//  AppointmentsView.swift
//  FIlaMed
//
//  Created by Danilo Araújo on 22/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import UIKit

class AppointmentsView: UIView {
    
    let appointmentsTable: UITableView = UITableView()
    
    public init() {
        super.init(frame: .zero)
        self.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
        self.setup()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        self.addSubview(self.appointmentsTable)
        
        //AutoLayout settings
        self.appointmentsTable.translatesAutoresizingMaskIntoConstraints = false
        self.appointmentsTable.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.appointmentsTable.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.appointmentsTable.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        self.appointmentsTable.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
        //Table settings
        self.appointmentsTable.register(AppointmentsHeader.self, forHeaderFooterViewReuseIdentifier: "appointmentsHeader")
        self.appointmentsTable.register(AppointmentCell.self, forCellReuseIdentifier: "appointmentCell") //We may use more than one type of cell.
        self.appointmentsTable.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.appointmentsTable.rowHeight = 104
        
    }
}

class AppointmentCell: UITableViewCell {
    
    let clinicName: UILabel = UILabel()
    let specialty: UILabel = UILabel()
    let time: UILabel = UILabel()
    let division: UIView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        

        self.layer.cornerRadius = 8
        self.backgroundColor = .systemGray
        
        
        self.addSubview(self.clinicName)
        self.addSubview(self.specialty)
        self.addSubview(self.time)
        self.addSubview(self.division)
        
        self.setupConstraints()
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
        
        NSLayoutConstraint.activate([
            clinicName.heightAnchor.constraint(equalToConstant: 30),
            clinicName.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            clinicName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5)
        ])
        
        NSLayoutConstraint.activate([
            specialty.heightAnchor.constraint(equalToConstant: 30),
            specialty.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            specialty.topAnchor.constraint(equalTo: clinicName.topAnchor, constant: 26)
        ])
        
        NSLayoutConstraint.activate([
            time.heightAnchor.constraint(equalToConstant: 30),
            time.topAnchor.constraint(equalTo: clinicName.topAnchor),
            time.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            division.heightAnchor.constraint(equalToConstant: 1),
            division.topAnchor.constraint(equalTo: specialty.bottomAnchor),
            division.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            division.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
    //We need to correct the fonts
    func setupStyles(){
        self.division.backgroundColor = .gray
        
        self.clinicName.font = UIFont.boldSystemFont(ofSize: 17)
        self.specialty.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.light)
    }
    
}

//We need to correct headers color
class AppointmentsHeader: UITableViewHeaderFooterView {
    let title = UILabel()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureContents() {
        contentView.addSubview(title)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.boldSystemFont(ofSize: 22)
        title.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        NSLayoutConstraint.activate([
            title.heightAnchor.constraint(equalToConstant: 30),
            title.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            title.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
