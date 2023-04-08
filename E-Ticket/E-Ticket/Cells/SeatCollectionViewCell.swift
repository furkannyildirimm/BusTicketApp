//
//  SeatCollectionViewCell.swift
//  E-Ticket
//
//  Created by STARK on 5.04.2023.
//

import UIKit

class SeatCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var seatImg: UIImageView!
    
    @IBOutlet weak var seatNumberLabel: UILabel!
    
    func setup(model: Seats) {
        seatImg.image = UIImage(named: model.seatsImage ?? "")
        
    }
    
    func setup(seatNumber: Int) {
        seatNumberLabel.text = "\(seatNumber)"
    }
}
