//
//  MainCell.swift
//  AviTask
//
//  Created by Otto Dzhandzhuliya on 02.02.2023.
//

import UIKit

class MainCell: UITableViewCell {
    
    static let reuseId = "MainCell"
    
    let name = UILabel(text: "Name", font: ODFonts.regulatTextFont)
    let phoneNumber = UILabel(text: "Phonenumber", font: ODFonts.regulatTextFont)
    let skills = UILabel(text: "Skillz", font: ODFonts.regulatTextFont)


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: MainCell.reuseId)
        
        addSubview(name)
        addSubview(phoneNumber)
        addSubview(skills)
        let namePhoneStack = UIStackView(arrangedSubviews: [name,phoneNumber], axis: .vertical, spacing: 2)
        addSubview(namePhoneStack)
        skills.numberOfLines = 3
        
        
        
        Helper.tamicOff(views: [name,phoneNumber,skills,namePhoneStack])
        
        
        
        
        NSLayoutConstraint.activate([namePhoneStack.topAnchor.constraint(equalTo: topAnchor,constant: 3),
                                     namePhoneStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
                                     skills.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2),
                                     skills.topAnchor.constraint(equalTo: topAnchor, constant: 3),
                                     skills.widthAnchor.constraint(equalToConstant: 150)])
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}
