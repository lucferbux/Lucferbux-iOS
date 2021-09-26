//
//  lucferbux_iosApp.swift
//  Shared
//
//  Created by lucas fernández on 2/8/21.
//

import SwiftUI
#if !os(watchOS)
    import Firebase
#endif


@main
struct lucferbux_iosApp: App {
    
    init() {
        #if !os(watchOS)
            FirebaseApp.configure()
        #endif
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
