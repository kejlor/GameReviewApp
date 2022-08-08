//
//  GameCharacter+Ext.swift
//  GameReviewApp
//
//  Created by Bartosz Wojtkowiak on 08/08/2022.
//

import Foundation
import CoreData

extension GameCharacter: BaseModel {
    static func getGameCharactersByGameId(gameID: NSManagedObjectID) -> [GameCharacter] {
        guard let game = Game.byId(id: gameID) as? Game,
              let gameCharacters = game.gameCharacters
        else {
            return []
        }
        
        return (gameCharacters.allObjects as? [GameCharacter]) ?? []
    }
}
