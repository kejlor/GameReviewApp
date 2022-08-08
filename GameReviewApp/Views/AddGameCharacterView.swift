//
//  AddGameCharacterView.swift
//  GameReviewApp
//
//  Created by Bartosz Wojtkowiak on 08/08/2022.
//

import SwiftUI

struct AddGameCharacterView: View {
    let game: GameViewModel
    @StateObject private var addGameCharacterVM = AddGameCharacterViewModel()
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        Form {
            VStack(alignment: .leading) {
                Text("Add Game Character")
                Text(game.title)
            }
            TextField("Enter name", text: $addGameCharacterVM.name)
            Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            }
            Button("Save") {
                addGameCharacterVM.addGameCharacterToGame(gameId: game.id)
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct AddGameCharacterView_Previews: PreviewProvider {
    static var previews: some View {
        let game = GameViewModel(game: Game(context: CoreDataProvider.shared.persistentContainer.viewContext))
        
        AddGameCharacterView(game: game)
    }
}
