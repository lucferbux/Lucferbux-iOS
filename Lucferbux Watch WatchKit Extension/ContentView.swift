//
//  ContentView.swift
//  Lucferbux Watch WatchKit Extension
//
//  Created by lucas fernández on 25/9/21.
//

import SwiftUI

struct ContentView: View {
    let news = newsList
    
    var body: some View {
        NavigationView {
            List(news) { news in
                
                NavigationLink(destination: NewsDetail(news: news)) {
                    NewsCard(news: news)
                }.buttonStyle(PlainButtonStyle())
            }.navigationTitle("Latest News")
            
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
