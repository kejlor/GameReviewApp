//
//  AddReviewViewModel.swift
//  GameReviewApp
//
//  Created by Bartosz Wojtkowiak on 08/08/2022.
//

import Foundation

class AddReviewViewModel: ObservableObject {
    var title = ""
    var text = ""
    
    func addReviewForGame(vm: GameViewModel) {
        let game: Game? = Game.byId(id: vm.id)
        
        if let game = game {
            let review = Review(context: Review.viewContext)
            review.title = title
            review.text = text
            review.game = game
            
            review.save()
        }
    }
}
