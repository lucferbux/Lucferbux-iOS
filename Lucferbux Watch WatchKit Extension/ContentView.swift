//
//  ContentView.swift
//  Lucferbux Watch WatchKit Extension
//
//  Created by lucas fernández on 25/9/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("Logo")
            Text("Welcome to my app")
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}