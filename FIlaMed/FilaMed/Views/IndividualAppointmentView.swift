//
//  IndividualAppointmentView.swift
//  FIlaMed
//
//  Created by Danilo Araújo on 22/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import UIKit

class IndividualAppointmentView: UIView, CodeView {
    func buildViewHierarchy() {
        return
    }

    func setupContraints() {
        return
    }

    func setupAdditionalConfiguration() {
        self.backgroundColor = .white
    }

    public init() {
        super.init(frame: .zero)
        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
