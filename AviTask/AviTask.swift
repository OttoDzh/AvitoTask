//
//  AviTask.swift
//  AviTask
//
//  Created by Otto Dzhandzhuliya on 03.02.2023.
//

import Foundation

// MARK: - AVITask
struct AVITask: Codable {
    let company: Company
}

// MARK: - Company
struct Company: Codable {
    let name: String
    let employees: [Employee]
}

// MARK: - Employee
struct Employee: Codable {
    let name: String
    let phoneNumber: String
    let skills: [String]

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case phoneNumber = "phone_number"
        case skills = "skills"
    }
}
