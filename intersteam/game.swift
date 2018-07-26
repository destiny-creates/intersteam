//
//  game.swift
//  intersteam
//
//  Created by Chris Cook on 7/25/18.
//  Copyright © 2018 destinycreates. All rights reserved.
//

import Foundation

class Game {
    var title: String
    var genre: String
    var availability: Bool = true
    var dueDate: Date!
    
    init(title: String, genre: String) {
        self.title = title
        self.genre = genre
    }

}







