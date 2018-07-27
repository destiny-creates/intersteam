//
//  addGameViewController.swift
//  intersteam
//
//  Created by Chris Cook on 7/27/18.
//  Copyright © 2018 destinycreates. All rights reserved.
//

import UIKit

class addGameViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet weak var genrePicker: UIPickerView!
    @IBOutlet weak var titleTextField: UITextField!
    let genres = ["RPG","FPS","Racing"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genres.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genres[row]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    func displayErrorAlert() {
        let alertController = UIAlertController(title: "Error", message: "New games must have a title", preferredStyle: .actionSheet)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(action)
        self.present(alertController,animated: true, completion: nil)
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let gameTitle = titleTextField.text, gameTitle != "" else {
            displayErrorAlert()
            return
        }
        let selectedGenreRow = genrePicker.selectedRow(inComponent: 0)
        let selectedGenre = genres[selectedGenreRow]
        
        let newGame = Game(title: gameTitle, genre: selectedGenre)
        GameManager.sharedInstance.addGame(game: newGame)
        self.performSegue(withIdentifier: "unwindToGameLibrary", sender: self)
    }
}
