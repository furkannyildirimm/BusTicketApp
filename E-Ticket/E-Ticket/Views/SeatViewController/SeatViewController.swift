//
//  SeatViewController.swift
//  E-Ticket
//
//  Created by Furkan YILDIRIM on 3.04.2023.
//

import UIKit

final class SeatViewController: UIViewController{
    
    var totalSeats = 55

    @IBOutlet weak var seatsCollectionView: UICollectionView!
    @IBOutlet weak var selectedSeatsLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    var busTicketModel = BusTicket()
    var selectedIndexPath: IndexPath?
    var selectedSeats = [Int]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        configureCollectionView()
        
        seatsCollectionView?.reloadData()

    }
    
    private func configureCollectionView(){
        
        seatsCollectionView.delegate = self
        seatsCollectionView.dataSource = self
        
    }
    
    func updateTotalPrice() {
        let seatPrice = 500
        let totalPrice = selectedSeats.count * seatPrice
        totalPriceLabel.text = "\(totalPrice) TL"
    }
    
}

extension SeatViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 60
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "seatCell", for: indexPath) as! SeatCollectionViewCell

        
        cell.seatNumberLabel.text = "\(indexPath.row + 1)"
        
        
        let hidden = (indexPath.row == 28 || indexPath.row == 29) || (indexPath.row - 2) % 5 == 0 && indexPath.row <= totalSeats
        cell.isHidden = hidden
        
        
        cell.setup(model: Seats(seatsImage: "seat", seatsNumber: indexPath.row+1))
        
        if selectedSeats.contains(indexPath.row+1) {
                    cell.seatImg.image = UIImage(named: "seat2")
                } else {
                    cell.seatImg.image = UIImage(named: "seat")
                }
                
                return cell
            }
            
            func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
                let selectedCell = collectionView.cellForItem(at: indexPath) as! SeatCollectionViewCell
                
                let seatNumber = indexPath.row + 1
                
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
                        Alert.showAlert(alertTitle: "UYARI", alertMessage: "5 Koltuktan fazla seçemezsin.", defaultTitle: "OK", cancelTitle: "Cancel", viewController: self)
                    }
                }
                
                selectedSeatsLabel.text = selectedSeats.map { String($0) }.joined(separator: ", ")
                updateTotalPrice()
            }
    
    
    
        }
        
    
    
    
    
    
    
    

