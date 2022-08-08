//
//  GameListViewModel.swift
//  GameReviewApp
//
//  Created by Bartosz Wojtkowiak on 08/08/2022.
//

import Foundation
import CoreData

class GameListViewModel: ObservableObject {
    @Published var games = [GameViewModel]()
    
    func deleteGame(game: GameViewModel) {
        let game: Game? = Game.byId(id: game.id)
        
        if let game = game {
            game.delete()
        }
    }
    
    func getAllGames() {
        let games: [Game] = Game.all()
        
        DispatchQueue.main.async {
            self.games = games.map(GameViewModel.init)
        }
    }
}

struct GameViewModel {
    let game: Game
    
    var id: NSManagedObjectID {
        return game.objectID
    }
    
    var title: String {
        return game.title ?? ""
    }
    
    var producer: String {
        return game.producer ?? "Not avaiable"
    }
    
    var publishedAt: String? {
        return game.publishedAt?.asFormattedString()
    }
    
    var rating: Int? {
        return Int(game.rating)
    }
}
