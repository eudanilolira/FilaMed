//
//  LineView.swift
//  FIlaMed
//
//  Created by Danilo Araújo on 22/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import UIKit

class LineView: UIScrollView {
    
    let doctorInformationView: DoctorInformationView = DoctorInformationView()
    let lineIndicatiorView: LineIndicatorView = LineIndicatorView()
    
    public init() {
        super.init(frame: .zero)
        setupStyle()
        setupDoctorInformationView()
        setupLineIndicatorView(upperView: doctorInformationView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupStyle() {
        self.backgroundColor = .systemGray6
    }
    
    func setupDoctorInformationView() {
        self.addSubview(self.doctorInformationView)
        self.doctorInformationView.setupConstraints()
    }
    
    func setupLineIndicatorView(upperView: UIView) {
        self.addSubview(self.lineIndicatiorView)
        self.lineIndicatiorView.setupConstraints(upperView)

    }
    
}

