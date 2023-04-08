//
//  TicketViewController.swift
//  E-Ticket
//
//  Created by STARK on 2.04.2023.
//

import UIKit

class TicketViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var selectedCompanyList = [BusTicket]()
    
    var ticketMove = TravelMoveModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "VoyageCell", bundle: nil), forCellReuseIdentifier: "VoyageCell")
        selectedCompanyList.append(BusTicket(time: "13:30", price: "300 ₺", busCompImg: "kamilkoc",from: ticketMove.from, to: ticketMove.to, day: ticketMove.day, month: ticketMove.month, year: ticketMove.year))
        selectedCompanyList.append(BusTicket(time: "16:30", price: "350 ₺", busCompImg: "asyaTur",from: ticketMove.from, to: ticketMove.to, day: ticketMove.day, month: ticketMove.month, year: ticketMove.year))
        selectedCompanyList.append(BusTicket(time: "20:30", price: "450 ₺", busCompImg:"pamukkaleturizm",from: ticketMove.from, to: ticketMove.to, day: ticketMove.day, month: ticketMove.month, year: ticketMove.year))
        selectedCompanyList.append(BusTicket(time: "17:30", price: "150 ₺", busCompImg: "ulusoy",from: ticketMove.from, to: ticketMove.to, day: ticketMove.day, month: ticketMove.month, year: ticketMove.year))
        selectedCompanyList.append(BusTicket(time: "15:30", price: "250 ₺", busCompImg: "metro",from: ticketMove.from, to: ticketMove.to, day: ticketMove.day, month: ticketMove.month, year: ticketMove.year))
        
        print(ticketMove.from)

    }
    
    
    }



extension TicketViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier:"VoyageCell" , for: indexPath) as! VoyageCell
        
        cell.configure(model: selectedCompanyList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        selectedCompanyList.count
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectModel = selectedCompanyList[indexPath.row]
        guard let vc = storyboard?.instantiateViewController (withIdentifier: "SeatViewController") as? SeatViewController else { return }
        vc.busTicketModel = selectModel
        navigationController?.pushViewController(vc, animated: true)
       
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    
}
