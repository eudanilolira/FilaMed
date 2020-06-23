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
//        self.addSubview(self.profileButton)
//        self.profileButton.setupConstraints()
        self.appointmentsTable.setupConstraints()
        

        
        
    }
}

//class ProfileButton: UIButton {
//    override init(frame: CGRect) {
//        super.init(frame: .zero)
//        let profileConfiguration = UIImage.SymbolConfiguration(weight: .regular)
//        let profileImage = UIImage(systemName: "person.circle.fill", withConfiguration: profileConfiguration)
//        self.setBackgroundImage(profileImage, for: .normal)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func setupConstraints() {
//        self.translatesAutoresizingMaskIntoConstraints = false
//        self.centerYAnchor.constraint(equalTo: superview!.).isActive = true
//        self.trailingAnchor.constraint(equalTo: superview!.layoutMarginsGuide.trailingAnchor).isActive = true
//    }
//}


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
        self.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
        self.selectionStyle = .none
        self.content.backgroundColor = .white
        
        content.setupConstraints()
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
    let accessAppointment: UIButton = UIButton()
    let statusLabel: UILabel = UILabel()
    
    public init() {
        super.init(frame: .zero)
        
        self.layer.cornerRadius = 8
        self.backgroundColor = .clear
        
        
        self.addSubview(self.clinicName)
        self.addSubview(self.specialty)
        self.addSubview(self.time)
        self.addSubview(self.division)
        self.addSubview(self.accessAppointment)
        self.addSubview(self.statusLabel)
        
        self.setupStyles()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.accessAppointment.translatesAutoresizingMaskIntoConstraints = false
        self.clinicName.translatesAutoresizingMaskIntoConstraints = false
        self.specialty.translatesAutoresizingMaskIntoConstraints = false
        self.time.translatesAutoresizingMaskIntoConstraints = false
        self.division.translatesAutoresizingMaskIntoConstraints = false
        self.statusLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 88),
            self.topAnchor.constraint(equalTo: superview!.topAnchor, constant: 16),
            self.leadingAnchor.constraint(equalTo: superview!.layoutMarginsGuide.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: superview!.layoutMarginsGuide.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            clinicName.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            clinicName.topAnchor.constraint(equalTo: self.topAnchor, constant: 5)
        ])
        
        NSLayoutConstraint.activate([
            specialty.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            specialty.topAnchor.constraint(equalTo: clinicName.topAnchor, constant: 26)
        ])
        
        NSLayoutConstraint.activate([
            time.topAnchor.constraint(equalTo: clinicName.topAnchor),
            time.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            accessAppointment.topAnchor.constraint(equalTo: time.topAnchor),
            accessAppointment.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
        ])
        
        NSLayoutConstraint.activate([
            division.heightAnchor.constraint(equalToConstant: 1),
            division.topAnchor.constraint(equalTo: specialty.topAnchor, constant: 23),
            division.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            division.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            statusLabel.topAnchor.constraint(equalTo: division.topAnchor, constant: 8),
            statusLabel.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            statusLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    //We need to correct the fonts
    func setupStyles(){
        self.division.backgroundColor = .gray
        
        let ultraLightConfiguration = UIImage.SymbolConfiguration(weight: .regular)
        let ultraLightSymbolImage = UIImage(systemName: "chevron.right", withConfiguration: ultraLightConfiguration)
        
        self.accessAppointment.setBackgroundImage(ultraLightSymbolImage, for: .normal)
        self.accessAppointment.setTitleColor(.blue, for: .normal)
        
        self.clinicName.font = UIFont.boldSystemFont(ofSize: 17)
        self.specialty.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.light)
        
        self.statusLabel.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.medium)
        self.statusLabel.textColor = #colorLiteral(red: 0.9294117647, green: 0.4196078431, blue: 0.3058823529, alpha: 1)
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
        title.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
        view.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)

        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: 30),
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            view.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
        
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: 30),
            title.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            title.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            title.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            
        ])
    }
}
