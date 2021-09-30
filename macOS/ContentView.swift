//
//  ContentView.swift
//  Shared
//
//  Created by lucas fernández on 2/8/21.
//

import SwiftUI

struct ContentView: View {
    

    @ViewBuilder
    var body: some View {
        Sidebar()
            .frame(minWidth: 1000, maxWidth: .infinity, minHeight: 600, maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
