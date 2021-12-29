//
//  NewsCardContent.swift
//  Lucferbux (iOS)
//
//  Created by Lucas Fernández Aragón on 29/12/21.
//

import SwiftUI

struct NewsCardContent: View {
    @ObservedObject var newsListViewModel = NewsListViewModel()
    
    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: [GridItem(.adaptive(minimum: 300), spacing: 20)],
                spacing: 20) {
                    ForEach(newsListViewModel.newsViewModels) { newsViewModel in
                        
                        NavigationLink(destination: NewsDetailContent(newsViewModel: newsViewModel)) {
                            NewsCardView(newsViewModel: newsViewModel)
                        }
                        .buttonStyle(.plain)
                    }
                }.padding(.horizontal)
        }
    }
}

struct NewsCardContent_Previews: PreviewProvider {
    static var previews: some View {
        NewsCardContent()
    }
}
