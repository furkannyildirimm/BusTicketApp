//
//  InfoTicketViewController.swift
//  E-Ticket
//
//  Created by Furkan YILDIRIM on 10.04.2023.
//

import UIKit

class InfoTicketViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var surnameLbl: UILabel!
    @IBOutlet weak var ıdLbl: UILabel!
    @IBOutlet weak var phoneNumberLbl: UILabel!
    @IBOutlet weak var fromLbl: UILabel!
    @IBOutlet weak var toLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var seatNumberLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let name = UserDefaults.standard.object(forKey: "Name")
        let surname = UserDefaults.standard.object(forKey: "Surname")
        let id = UserDefaults.standard.object(forKey: "ID")
        timeLbl.text = "12:30"

        if let userName = name as? String {
                    nameLbl.text = "\(userName)"
                }
        if let userSurname = surname as? String {
                    surnameLbl.text = "\(userSurname)"
                }
        if let userId = id as? String {
                    ıdLbl.text = "\(userId)"
                }
        let phone = UserDefaults.standard.object(forKey: "Phone")
        if let iphone = phone as? String {
            phoneNumberLbl.text = "\(iphone)"
        }
        let from = UserDefaults.standard.object(forKey: "fromLocation")
        if let ifrom = from as? String {
            fromLbl.text = "\(ifrom)"
        }
        let to = UserDefaults.standard.object(forKey: "toLocation")
        if let ito = to as? String {
            toLbl.text = "\(ito)"
        }
        let date = UserDefaults.standard.object(forKey: "date")
        if let idate = date as? String {
            dateLbl.text = "\(idate)"
        }
            
        
}
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)

            if let seatNumbersString = UserDefaults.standard.string(forKey: "selectedSeats") {
                let seatNumbers = seatNumbersString.components(separatedBy: ",").compactMap { Int($0) }

                seatNumberLbl.text = seatNumbers.map { String($0) }.joined(separator: ", ")
            }
        }
    
    @IBAction func homeBtn(_ sender: UIButton) {
        
        
    }
        
}
    



