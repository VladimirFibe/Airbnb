//
//  ExploreRatingView.swift
//  Airbnb
//
//  Created by Vladimir Fibe on 21.10.2023.
//

import SwiftUI

struct ExploreRatingView: View {
    var body: some View {
        HStack(spacing: 2.0) {
            Image(systemName: "star.fill")
            Text("4.86")
        }
    }
}

#Preview {
    ExploreRatingView()
}
