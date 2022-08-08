//
//  GameListView.swift
//  GameReviewApp
//
//  Created by Bartosz Wojtkowiak on 08/08/2022.
//

import SwiftUI

struct GameListView: View {
    @StateObject private var gameListVM = GameListViewModel()
    @State private var isPresented = false
    
    var body: some View {
        List {
            ForEach(gameListVM.games, id: \.id) { game in
                NavigationLink(destination: ReviewListView(game: game)) {
                    GameCell(game: game)
                }
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Games")
        .navigationBarItems(trailing: Button("Add Game") {
            isPresented = true
        })
        .sheet(isPresented: $isPresented, onDismiss: {
            gameListVM.getAllGames()
        },  content: {
            AddGameView()
        })
        .embedInNavigationView()
        .onAppear(perform: {
            gameListVM.getAllGames()
        })
    }
}

struct GameListView_Previews: PreviewProvider {
    static var previews: some View {
        GameListView()
    }
}

extension GameListView {
    private func deleteGame(at indexSet: IndexSet) {
        indexSet.forEach { index in
            let game = gameListVM.games[index]
            gameListVM.deleteGame(game: game)
            gameListVM.getAllGames()
        }
    }
}

struct GameCell: View {
    let game: GameViewModel
    
    var body: some View {
        HStack {
            VStack {
                Text(game.title)
                Text(game.producer)
                Text(game.publishedAt ?? "")
            }
            Spacer()
            RatingView(rating: .constant(game.rating))
        }
    }
}
