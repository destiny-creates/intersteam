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
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

