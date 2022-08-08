//
//  AddGameViewModel.swift
//  GameReviewApp
//
//  Created by Bartosz Wojtkowiak on 08/08/2022.
//

import Foundation

class AddGameViewModel: ObservableObject {
    var title = ""
    var producer = ""
    @Published var rating: Int? = nil
    var publishedAt = Date()
    
    func save() {
        let game = Game(context: Game.viewContext)
        game.title = title
        game.producer = producer
        game.rating = Double(rating ?? 0)
        game.publishedAt = publishedAt
        
        game.save()
    }
}
