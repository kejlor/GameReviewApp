//
//  GameCharacterListView.swift
//  GameReviewApp
//
//  Created by Bartosz Wojtkowiak on 08/08/2022.
//

import SwiftUI

struct GameCharacterListView: View {
    @State private var isPresented = false
    @StateObject private var gameCharacterListVM = GameCharacterListViewModel()
    let game: GameViewModel
    
    var body: some View {
        List {
            ForEach(gameCharacterListVM.gameCharacters, id: \.gameCharacterId) { gameCharacter in
                HStack {
                    Text(gameCharacter.name)
                    Spacer()
                }
            }
        }
        .onAppear {
            gameCharacterListVM.getGameCharactersByGame(vm: game)
        }
        .sheet(isPresented: $isPresented, onDismiss: {
            gameCharacterListVM.getGameCharactersByGame(vm: game)
        }) {
            AddGameCharacterView(game: game)
        }
    }
}

struct GameCharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        let game = GameViewModel(game: Game(context: CoreDataProvider.shared.persistentContainer.viewContext))
        
        GameCharacterListView(game: game)
    }
}
