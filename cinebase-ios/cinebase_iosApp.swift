//
//  cinebase_iosApp.swift
//  cinebase-ios
//
//  Created by Andimas Bagaswara on 18/12/20.
//

import SwiftUI

@main
struct cinebase_iosApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            DashboardScreen()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
