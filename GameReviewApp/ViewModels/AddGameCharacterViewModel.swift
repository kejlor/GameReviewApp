//
//  AddGameCharacterViewModel.swift
//  GameReviewApp
//
//  Created by Bartosz Wojtkowiak on 08/08/2022.
//

import Foundation
import CoreData

class AddGameCharacterViewModel: ObservableObject {
    var name = ""
    
    func addGameCharacterToGame(gameId: NSManagedObjectID) {
        let game: Game? = Game.byId(id: gameId)
        
        if let game = game {
            let gameCharacter = GameCharacter(context: GameCharacter.viewContext)
            gameCharacter.name = name
            gameCharacter.addToGames(game)
            
            try? gameCharacter.save()
        }
    }
}
