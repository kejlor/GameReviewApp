//
//  AddReviewView.swift
//  GameReviewApp
//
//  Created by Bartosz Wojtkowiak on 08/08/2022.
//

import SwiftUI

struct AddReviewView: View {
    @StateObject private var addReviewVM = AddReviewViewModel()
    @Environment(\.presentationMode) var presentationMode
    let game: GameViewModel
    
    var body: some View {
        Form {
            TextField("Enter title", text: $addReviewVM.title)
            TextEditor(text: $addReviewVM.text)
            
            HStack {
                Spacer()
                Button("Save") {
                    addReviewVM.addReviewForGame(vm: game)
                    presentationMode.wrappedValue.dismiss()
                }
                Spacer()
            }
        }
        .navigationTitle("Add review")
        .embedInNavigationView()
    }
}

struct AddReviewView_Previews: PreviewProvider {
    static var previews: some View {
        let game = GameViewModel(game: Game(context: CoreDataProvider.shared.persistentContainer.viewContext))
        
        AddReviewView(game: game)
    }
}
