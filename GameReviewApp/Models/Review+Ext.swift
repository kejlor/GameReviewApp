//
//  Review+Ext.swift
//  GameReviewApp
//
//  Created by Bartosz Wojtkowiak on 08/08/2022.
//

import Foundation
import CoreData

extension Review: BaseModel {    
    static func getReviewsGameId(gameId: NSManagedObjectID) -> [Review] {
        guard let game = Game.byId(id: gameId) as? Game,
              let reviews = game.reviews
        else {
            return []
        }
        
        return (reviews.allObjects as? [Review]) ?? []
    }
}
