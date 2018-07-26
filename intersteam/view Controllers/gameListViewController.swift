//
//  ViewController.swift
//  intersteam
//
//  Created by Chris Cook on 7/25/18.
//  Copyright © 2018 destinycreates. All rights reserved.
//

import UIKit

class gameListViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GameManager.sharedInstance.getGameCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameTableViewCell") as! gameTableViewCell
        let gameForIndex = GameManager.sharedInstance.getGame(at: indexPath.row)
        cell.gameTitleLabel.text = gameForIndex.title
        cell.gameGenreLabel.text = gameForIndex.genre
        
        if gameForIndex.availability {
            cell.availabilityLabel.text = "available"
            cell.availabilityLabel.backgroundColor = BackgroundColors.checkedInGreen
            
        } else {
            cell.availabilityLabel.text = "checked out"
            cell.availabilityLabel.backgroundColor = BackgroundColors.checkedOutOrange
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (_, _) in
            GameManager.sharedInstance.removeGame(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
    
        }
        
        return [deleteAction]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    struct BackgroundColors {
        static let checkedInGreen = UIColor(hex: "2ECC71")
        static let checkedOutOrange = UIColor(hex: "F5AB35")
    }
    
}
//Extension to the UIColor class to allow us to easily use Hex values to create new UIColor instances
extension UIColor {
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
}
