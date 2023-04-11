//
//  SeatCollectionViewCell.swift
//  E-Ticket
//
//  Created by Furkan YILDIRIM on 5.04.2023.
//

import UIKit

class SeatCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var seatImg: UIImageView!
    
    @IBOutlet weak var seatNumberLabel: UILabel!
    
    
    
    
    
    func setup(seatNumber: String, selectedSeats: [Int]) {
        seatNumberLabel.text = seatNumber
        if let seat = Int(seatNumber){
            if selectedSeats.contains(seat) {
                seatImg.image = UIImage(named: "seat2")
            } else {
                seatImg.image = UIImage(named: "seat")
            }
        }
        
    }
    

}
