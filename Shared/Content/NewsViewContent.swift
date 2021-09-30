//
//  NewsViewList.swift
//  lucferbux ios
//
//  Created by lucas fernández on 26/9/21.
//

import SwiftUI

struct NewsViewContent: View {
    @ObservedObject var newsListViewModel = NewsListViewModel()
    
    
    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: [GridItem(.adaptive(minimum: 320), spacing: 0)],
                spacing: 0) {
                    ForEach(newsListViewModel.newsViewModels) { newsViewModel in
                        NewsCardView(newsViewModel: newsViewModel).padding()
                    }
            }
        }
    }
                    
}

struct NewsViewList_Previews: PreviewProvider {
    static var previews: some View {
        NewsViewContent()
    }
}
