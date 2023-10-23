//
//  ProfileRow.swift
//  Airbnb
//
//  Created by Vladimir Fibe on 23.10.2023.
//

import SwiftUI

struct ProfileRow: View {
    let image: String
    let title: String
    var body: some View {
        VStack {
            HStack {
                Image(systemName: image)
                Text(title).font(.subheadline)
                Spacer()
                Image(systemName: "chevron.right")
            }
            Divider()
        }
    }
}

#Preview {
    ProfileRow(image: "gear", title: "Settings")
}
