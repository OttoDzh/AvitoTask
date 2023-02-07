//
//  MainView.swift
//  AviTask
//
//  Created by Otto Dzhandzhuliya on 31.01.2023.
//

import UIKit

class MainView: UIView {
    
    let tableView = UITableView()
    let companyNameLabel = UILabel(text: "Company name: Avito", font: ODFonts.avenirFont)
    let employeLabel = UILabel(text: "Employers", font: ODFonts.avenirFont)
    let skillsLabel = UILabel(text: "Skills", font: ODFonts.avenirFont)

    init() {
        super.init(frame: CGRect())
        setupViews()
        setupConstraints()
    }
    
    
    func setupViews() {
        backgroundColor = .lightGray
        tableView.separatorStyle = .singleLine
        tableView.register(MainCell.self, forCellReuseIdentifier: MainCell.reuseId)
        tableView.layer.cornerRadius = 15
        tableView.separatorStyle = .singleLine
    }
    
    func setupConstraints() {
        addSubview(tableView)
        addSubview(companyNameLabel)
        addSubview(employeLabel)
        addSubview(skillsLabel)
        Helper.tamicOff(views: [tableView,companyNameLabel,employeLabel,skillsLabel])
        
        NSLayoutConstraint.activate([tableView.topAnchor.constraint(equalTo: topAnchor,constant: 120),
                                     tableView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 24),
                                     tableView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -24),
                                     tableView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -24),
                                     companyNameLabel.bottomAnchor.constraint(equalTo: tableView.topAnchor,constant: -40),
                                     companyNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
                                     employeLabel.topAnchor.constraint(equalTo: companyNameLabel.bottomAnchor,constant: 10),
                                     employeLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
                                     skillsLabel.topAnchor.constraint(equalTo: employeLabel.topAnchor),
                                     skillsLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -96)])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
