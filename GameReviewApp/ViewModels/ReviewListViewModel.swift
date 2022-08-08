//
//  ReviewListViewModel.swift
//  GameReviewApp
//
//  Created by Bartosz Wojtkowiak on 08/08/2022.
//

import Foundation
import CoreData

class ReviewListViewModel: ObservableObject {
    @Published var reviews = [ReviewViewModel]()
    
    func getReviewsByGame(vm: GameViewModel) {
        DispatchQueue.main.async {
            self.reviews = Review.getReviewsGameId(gameId: vm.id).map(ReviewViewModel.init)
        }
    }
}

struct ReviewViewModel {
    let review: Review
    
    var reviewId: NSManagedObjectID {
        return review.objectID
    }
    
    var title: String {
        return review.title ?? ""
    }
    
    var text: String {
        return review.text ?? ""
    }
    
    var publishedDate: Date? {
        return review.publishedAt
    }
}
