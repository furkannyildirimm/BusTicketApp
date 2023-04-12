//
//  Passenger.swift
//  E-Ticket
//
//  Created by STARK on 9.04.2023.
//

import Foundation

class Passenger {
    
    var name: String
    var surname: String
    var ıd: String
    var phoneNumber: String
    
    init(name: String, surname: String, ıd: String, phoneNumber: String) {
        self.name = name
        self.surname = surname
        self.ıd = ıd
        self.phoneNumber = phoneNumber
    }
}
