//
//  ProfileView.swift
//  cinebase-ios
//
//  Created by Andimas Bagaswara on 19/12/20.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 0, content: {
            Text("Placeholder")
                .navigationTitle("Profile")
        })
        .embedNavigationView()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
