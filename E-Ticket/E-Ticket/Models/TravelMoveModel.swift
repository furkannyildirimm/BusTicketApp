//
//  TravelMoveModel.swift
//  E-Ticket
//
//  Created by Furkan YILDIRIM on 8.04.2023.
//

import Foundation

struct TravelMoveModel{
    var from: String
    var to: String
    var day: Int
    var month: Int
    var year: Int
    
    init(from: String = "", to: String = "" , day: Int = 31, month: Int = 12, year: Int = 1970) {
        self.from = from
        self.to = to
        self.day = day
        self.month = month
        self.year = year
    }
    
}
