//
//  MainView.swift
//  AviTask
//
//  Created by Otto Dzhandzhuliya on 31.01.2023.
//

import UIKit

class MainView: UIView {
    
    let tableView = UITableView()
    let companyNameLabel = UILabel(text: "Avito", font: ODFonts.avenirFont)

    init() {
        super.init(frame: CGRect())
        setupViews()
        setupConstraints()
    }
    
    
    func setupViews() {
        backgroundColor = .white
        tableView.separatorStyle = .singleLine
        tableView.register(MainCell.self, forCellReuseIdentifier: MainCell.reuseId)
    }
    
    func setupConstraints() {
        addSubview(tableView)
        addSubview(companyNameLabel)
        Helper.tamicOff(views: [tableView,companyNameLabel])
        
        NSLayoutConstraint.activate([tableView.topAnchor.constraint(equalTo: topAnchor,constant: 120),
                                     tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
                                     tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
                                     companyNameLabel.bottomAnchor.constraint(equalTo: tableView.topAnchor,constant: -30),
                                     companyNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 24)])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
