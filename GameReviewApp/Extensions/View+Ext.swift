//
//  View+Ext.swift
//  GameReviewApp
//
//  Created by Bartosz Wojtkowiak on 08/08/2022.
//

import Foundation
import SwiftUI

extension View {
    func embedInNavigationView() -> some View {
        NavigationView { self }
    }
}
