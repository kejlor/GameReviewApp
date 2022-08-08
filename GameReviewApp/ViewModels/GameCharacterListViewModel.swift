//
//  GameCharacterListViewModel.swift
//  GameReviewApp
//
//  Created by Bartosz Wojtkowiak on 08/08/2022.
//

import Foundation
import CoreData

class GameCharacterListViewModel: ObservableObject {
    @Published var gameCharacters = [GameCharacterViewModel]()
    
    func getGameCharactersByGame(vm: GameViewModel) {
        DispatchQueue.main.async {
            self.gameCharacters = GameCharacter.getGameCharactersByGameId(gameID: vm.id).map(GameCharacterViewModel.init)
        }
    }
}

struct GameCharacterViewModel {
    let gameCharacter: GameCharacter
    
    var gameCharacterId: NSManagedObjectID {
        return gameCharacter.objectID
    }
    
    var name: String {
        return gameCharacter.name ?? ""
    }
}
