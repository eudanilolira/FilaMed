//
//  ProgressStackView.swift
//  FilaMed
//
//  Created by Wilton Ramos on 30/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import UIKit

class ProgressStackView: UIStackView, CodeView {

    let firstProgressStepView = ProgressStepView()
    let secondProgressStepView = ProgressStepView()
    let thirdProgressStepView = ProgressStepView()
    let fourthProgressStepView = ProgressStepView()
    let firstDividerView = UIView()
    let secondDividerView = UIView()
    let thirdDividerView = UIView()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func buildViewHierarchy() {
        self.addArrangedSubview(firstProgressStepView)
        self.addArrangedSubview(secondProgressStepView)
        self.addArrangedSubview(thirdProgressStepView)
        self.addArrangedSubview(fourthProgressStepView)
    }

    func setupContraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.firstProgressStepView.translatesAutoresizingMaskIntoConstraints = false
        self.secondProgressStepView.translatesAutoresizingMaskIntoConstraints = false
        self.thirdProgressStepView.translatesAutoresizingMaskIntoConstraints = false
        self.fourthProgressStepView.translatesAutoresizingMaskIntoConstraints = false
        self.firstDividerView.translatesAutoresizingMaskIntoConstraints = false
        self.secondDividerView.translatesAutoresizingMaskIntoConstraints = false
        self.thirdDividerView.translatesAutoresizingMaskIntoConstraints = false
    }

    func setupAdditionalConfiguration() {
        self.firstProgressStepView.progressLabel.text = "Você entrou na fila!"
        self.firstProgressStepView.indicatorView.backgroundColor = #colorLiteral(red: 0.3725490196, green: 0.8117647059, blue: 0.3882352941, alpha: 1)
        self.secondProgressStepView.progressLabel.text = "O consultório já preparou seus documentos"
        self.secondProgressStepView.indicatorView.backgroundColor = #colorLiteral(red: 0.3333333333, green: 0.7333333333, blue: 0.3490196078, alpha: 1)
        self.thirdProgressStepView.progressLabel . text = "Você chegou ao local"
        self.thirdProgressStepView.indicatorView.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.5960784314, blue: 0.2666666667, alpha: 1)
        self.fourthProgressStepView.progressLabel.text = "Você foi atendido"
        self.fourthProgressStepView.indicatorView.backgroundColor = #colorLiteral(red: 0.1882352941, green: 0.4509803922, blue: 0.2, alpha: 1)

        self.axis = .vertical
        self.distribution = .fill
        self.alignment = .leading
        self.spacing = 12

        self.firstDividerView.backgroundColor = .black
    }
}
