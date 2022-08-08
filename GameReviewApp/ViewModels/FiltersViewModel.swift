//
//  FiltersViewModel.swift
//  GameReviewApp
//
//  Created by Bartosz Wojtkowiak on 08/08/2022.
//

import Foundation

class FiltersViewModel: ObservableObject {
    func filterGamesByTitle(title: String) -> [GameViewModel] {
        return Game.byGameTitle(title: title).map(GameViewModel.init)
    }
    
    func filterGamesByGameCharacterName(gameCharacterName: String) -> [GameViewModel] {
        return Game.byGameCharacterName(name: gameCharacterName).map(GameViewModel.init)
    }
    
    func filterGamesByPublishedAt(publishedAt: Date) -> [GameViewModel] {
        return Game.byPublishedAt(publishedAt: publishedAt).map(GameViewModel.init)
    }
    
    func filterGamesByMinimumRating(rating: Int) -> [GameViewModel] {
        return Game.byMinimumRating(minimumRating: rating).map(GameViewModel.init)
    }
}
