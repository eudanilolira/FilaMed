//
//  LineIndicatorView.swift
//  FilaMed
//
//  Created by Danilo Araújo on 24/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import UIKit

class LineIndicatorView: UIView {
    let progressLine: [ProgressStepView] = [ProgressStepView(), ProgressStepView(), ProgressStepView(), ProgressStepView()]
    let timeLeftLabel: UILabel = UILabel()
    let waitTimeLabel: UILabel = UILabel()
    
    public override init(frame: CGRect) {
        super.init(frame: .zero)
        setupStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStyle() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 8
        
        self.timeLeftLabel.text = "Saia de casa em: 15 minutos"
        self.waitTimeLabel.text = "Tempo de espera no local: 3 minutos"
        
        let textFont = UIFont.systemFont(ofSize: 12, weight: .regular)
        
        self.timeLeftLabel.font = textFont
        self.waitTimeLabel.font = textFont
    }
    
    func setupConstraints(_ upperView: UIView) {
        self.timeLeftLabel.translatesAutoresizingMaskIntoConstraints = false
        self.waitTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(progressLine[0])
        self.addSubview(timeLeftLabel)
        self.addSubview(waitTimeLabel)
        
        self.progressLine[0].setupConstraints(self)
        
        for i in 1...3 {
            self.addSubview(progressLine[i])
            self.progressLine[i].setupConstraints(progressLine[i-1])
        }
        
        self.timeLeftLabel.topAnchor.constraint(equalTo: self.progressLine[3].layoutMarginsGuide.bottomAnchor, constant: 60).isActive = true
        self.timeLeftLabel.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: 10).isActive = true
        
        self.waitTimeLabel.topAnchor.constraint(equalTo: self.timeLeftLabel.bottomAnchor, constant: 10).isActive = true
        self.waitTimeLabel.leadingAnchor.constraint(equalTo: self.timeLeftLabel.leadingAnchor).isActive = true
        
        self.centerXAnchor.constraint(equalTo: superview!.centerXAnchor).isActive = true
        self.topAnchor.constraint(equalTo: upperView.bottomAnchor, constant: 32).isActive = true
        self.widthAnchor.constraint(equalToConstant: 345).isActive = true
        self.heightAnchor.constraint(equalToConstant: 230).isActive = true
    }
}


class ProgressStepView: UIView {
    let progressLabel: UILabel = UILabel()
    let indicatorView: UIView = UIView()

    public init() {
        super.init(frame: .zero)
        self.addSubview(self.progressLabel)
        self.addSubview(self.indicatorView)
        setupStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStyle() {
        self.indicatorView.layer.cornerRadius = 9 //This value needs to be half of views size
        self.indicatorView.backgroundColor = #colorLiteral(red: 0.3725490196, green: 0.8117647059, blue: 0.3882352941, alpha: 1)
        
        self.progressLabel.text = "Você ainda não entrou na fila"
        self.progressLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
    }
    
    func setupConstraints(_ upperView: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.progressLabel.translatesAutoresizingMaskIntoConstraints = false
        self.indicatorView.translatesAutoresizingMaskIntoConstraints = false
        
        self.progressLabel.centerYAnchor.constraint(equalTo: self.indicatorView.centerYAnchor).isActive = true
        self.progressLabel.leadingAnchor.constraint(equalTo: self.indicatorView.safeAreaLayoutGuide.trailingAnchor, constant: 10).isActive = true
        
        self.indicatorView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor).isActive = true
        self.indicatorView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor).isActive = true
        self.indicatorView.heightAnchor.constraint(equalToConstant: 18).isActive = true
        self.indicatorView.widthAnchor.constraint(equalToConstant: 18).isActive = true
        
        self.topAnchor.constraint(equalTo: upperView.layoutMarginsGuide.topAnchor, constant: 20).isActive = true
        self.leadingAnchor.constraint(equalTo: superview!.layoutMarginsGuide.leadingAnchor).isActive = true
    }
}


