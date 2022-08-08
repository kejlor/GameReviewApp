//
//  Game+Ext.swift
//  GameReviewApp
//
//  Created by Bartosz Wojtkowiak on 08/08/2022.
//

import Foundation
import CoreData

extension Game: BaseModel {
    static func byGameTitle(title: String) -> [Game] {
        let request: NSFetchRequest<Game> = Game.fetchRequest()
        request.predicate = NSPredicate(format: "%K BEGINSWITH[cd] %@", #keyPath(Game.title), title)
        
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
    }
    
    static func byGameCharacterName(name: String) -> [Game] {
        let request: NSFetchRequest<Game> = Game.fetchRequest()
        request.predicate = NSPredicate(format: "gameCharacters.name CONTAINS %@", name)
        
        do {
            return try viewContext.fetch(request)
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    static func byPublishedAt(publishedAt: Date) -> [Game] {
        let request: NSFetchRequest<Game> = Game.fetchRequest()
        request.predicate = NSPredicate(format: "%K >= %@", #keyPath(Game.publishedAt), publishedAt as NSDate)
        
        do {
            return try viewContext.fetch(request)
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    static func byMinimumRating(minimumRating: Int) -> [Game] {
        let request: NSFetchRequest<Game> = Game.fetchRequest()
        request.predicate = NSPredicate(format: "%K >= %i", #keyPath(Game.rating), minimumRating)
        
        do {
            return try viewContext.fetch(request)
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
}
