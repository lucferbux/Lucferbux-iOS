//
//  lucferbux_iosApp.swift
//  Lucferbux Watch WatchKit Extension
//
//  Created by lucas fernández on 25/9/21.
//

import SwiftUI

@main
struct lucferbux_iosApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
