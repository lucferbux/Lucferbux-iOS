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
                columns: [GridItem(.adaptive(minimum: 300), spacing: 20)],
                spacing: 20) {
                    ForEach(newsListViewModel.newsViewModels) { newsViewModel in
                        NewsCardView(newsViewModel: newsViewModel)
                    }
                }.padding(.horizontal)
        }
    }
                    
}

struct NewsViewList_Previews: PreviewProvider {
    static var previews: some View {
        NewsViewContent()
    }
}
