//
//  SeatViewController.swift
//  E-Ticket
//
//  Created by Furkan YILDIRIM on 3.04.2023.
//

import UIKit

final class SeatViewController: UIViewController{
    
    var totalSeats = 56
    var counter = 0
    var busSeatNumDict = [Int : String]()
    var pathWayNumber = Int()
    var seatNum = Int()
    
    @IBOutlet weak var seatsCollectionView: UICollectionView!
    @IBOutlet weak var selectedSeatsLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    var busTicketModel = BusTicket()
    var selectedIndexPath: IndexPath?
    var selectedSeats = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareSeatsNumber()
        
        configureCollectionView()
        
        seatsCollectionView?.reloadData()
        
    }
    
    @IBAction func buyTicketBtn(_ sender: UIButton) {
        
        if selectedSeats.count == 0 {
            Alert.showAlert(alertTitle: "Warning!", alertMessage: "Please select a seat.", defaultTitle: "OK", cancelTitle: "Cancel", viewController: self)
        }
    }
    
    private func configureCollectionView(){
        
        seatsCollectionView.delegate = self
        seatsCollectionView.dataSource = self
        
    }
    
    func updateTotalPrice() {
        let seatPrice = 200
        let totalPrice = selectedSeats.count * seatPrice
        totalPriceLabel.text = "\(totalPrice) TL"
    }
    
    func prepareSeatsNumber() {
        pathWayNumber = 2
        seatNum = 1
        for i in 0...totalSeats{
            if i == pathWayNumber {
                if i == 56 {
                    busSeatNumDict[i] = String(seatNum)
                    seatNum = seatNum + 1
                } else {
                    busSeatNumDict[i] = ""
                    pathWayNumber = pathWayNumber + 5
                }
            } else {
                busSeatNumDict[i] = String(seatNum)
                seatNum = seatNum + 1
            }
        }
    }
}

extension SeatViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 55
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "seatCell", for: indexPath) as! SeatCollectionViewCell
        
        cell.seatNumberLabel.text = busSeatNumDict[indexPath.row]
        
        let hidden = (indexPath.row == 28 || indexPath.row == 29) || (indexPath.row - 2) % 5 == 0 && indexPath.row <= totalSeats
        cell.isHidden = hidden
        
        if let seatNumber = busSeatNumDict[indexPath.row] {
            cell.setup(seatNumber: seatNumber, selectedSeats: selectedSeats)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedCell = collectionView.cellForItem(at: indexPath) as! SeatCollectionViewCell
        
        guard let seatNumber = Int((selectedCell.seatNumberLabel?.text)!) else {
            return
        }
        
        if selectedSeats.contains(seatNumber) {
            
            if let index = selectedSeats.firstIndex(of: seatNumber) {
                selectedSeats.remove(at: index)
            }
            selectedCell.seatImg.image = UIImage(named: "seat")
        } else {
            
            if selectedSeats.count < 5 {
                selectedSeats.append(seatNumber)
                selectedCell.seatImg.image = UIImage(named: "seat2")
            } else {
                Alert.showAlert(alertTitle: "Warning!", alertMessage: "You can select up to 5 seats.", defaultTitle: "OK", cancelTitle: "Cancel", viewController: self)
                
            }
        }
        
        selectedSeatsLabel.text = selectedSeats.map { String($0) }.joined(separator: ", ")
        updateTotalPrice()
        
        let seatNumbersString = selectedSeats.map { String($0) }.joined(separator: ",")
        UserDefaults.standard.set(seatNumbersString, forKey: "selectedSeats")
        
        
        if let seatNumbersString = UserDefaults.standard.string(forKey: "selectedSeats") {
            let number = seatNumbersString.components(separatedBy: ",").compactMap { Int($0) }
            
        }
    }
}










