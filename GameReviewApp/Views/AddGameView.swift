//
//  AddGameView.swift
//  GameReviewApp
//
//  Created by Bartosz Wojtkowiak on 08/08/2022.
//

import SwiftUI

struct AddGameView: View {
    @StateObject private var addGameVM = AddGameViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Form {
            TextField("Enter game title", text: $addGameVM.title)
            TextField("Enter game producer", text: $addGameVM.producer)
            
            HStack {
                Text("Rating")
                Spacer()
                RatingView(rating: $addGameVM.rating)
            }
            DatePicker("Release Date", selection: $addGameVM.publishedAt)
            
            HStack {
                Spacer()
                Button("Save") {
                    addGameVM.save()
                    presentationMode.wrappedValue.dismiss()
                }
                Spacer()
            }
            .navigationTitle("Add Game")
        }
        .embedInNavigationView()
    }
}

struct AddGameView_Previews: PreviewProvider {
    static var previews: some View {
        AddGameView()
    }
}
