//
//  VoyageCell.swift
//  E-Ticket
//
//  Created by STARK on 2.04.2023.
//

import UIKit

class VoyageCell: UITableViewCell {

   
    @IBOutlet weak var busImg: UIImageView!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var fromLabel: UILabel!
    
    @IBOutlet weak var toLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func configure (model: BusTicket) {
        
        busImg.image = UIImage(named: model.busCompImg ?? "")
        priceLabel.text = model.price
        timeLabel.text = model.time
        fromLabel.text = model.from
        toLabel.text = model.to
        dateLabel.text = "\(model.day!)" + " / " + "\(model.month!)" + " / " + "\(model.year!)"
        
    }
    
}
