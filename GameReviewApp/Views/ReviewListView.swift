//
//  ReviewListView.swift
//  GameReviewApp
//
//  Created by Bartosz Wojtkowiak on 08/08/2022.
//

import SwiftUI

struct ReviewListView: View {
    let game: GameViewModel
    @State private var isPresented = false
    @StateObject private var reviewListVM = ReviewListViewModel()
    
    var body: some View {
        VStack {
            List(reviewListVM.reviews, id: \.reviewId) { review in
                HStack {
                    VStack(alignment: .leading) {
                        Text(review.title)
                        Text(review.text)
                            .font(.caption)
                    }
                    Spacer()
                    Text(review.publishedDate!.asFormattedString())
                }
            }
        }
        .navigationTitle(game.title)
        .navigationBarItems(trailing: Button("Add new review") {
            isPresented = true
        })
        .sheet(isPresented: $isPresented, onDismiss: {
            reviewListVM.getReviewsByGame(vm: game)
        }) {
            AddReviewView(game: game)
        }
        .onAppear {
            reviewListVM.getReviewsByGame(vm: game)
        }
    }
}

struct ReviewListView_Previews: PreviewProvider {
    static var previews: some View {
        let game = GameViewModel(game: Game(context: CoreDataProvider.shared.persistentContainer.viewContext))
        
        ReviewListView(game: game)
    }
}
