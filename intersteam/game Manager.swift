//
//  game Manager.swift
//  intersteam
//
//  Created by Chris Cook on 7/26/18.
//  Copyright © 2018 destinycreates. All rights reserved.
//

import Foundation

class GameManager {
    static let sharedInstance = GameManager()
    private init () {
        let game1 = Game(title: "Counter-strike : global offensive", genre: "FPS")
        let game2 = Game(title: "Momentum mod", genre: "fpv")
        let game3 = Game(title: "quake", genre: "FPS")
        
        games.append(game1)
        games.append(game2)
        games.append(game3)
        print(games)
        
    }
    private var games: [Game] = []

    func addGame(game: Game) {
        games.append(game)
    }
    func getGameCount() -> Int {
        return games.count
    }
    func getGame(at index: Int) -> Game {
        return games[index]
    }
}




































































































