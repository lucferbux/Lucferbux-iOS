//
//  NewsViewMacContent.swift
//  lucferbux ios (macOS)
//
//  Created by lucas fernández on 5/10/21.
//

import SwiftUI

struct NewsViewMacContent: View {
    @ObservedObject var newsListViewModel = NewsListViewModel()
    
    var body: some View {
        NavigationView {
            List(newsListViewModel.newsViewModels) { newsViewModel in
                            
                            NavigationLink(destination: NewsViewDetailContent(newsViewModel: newsViewModel)) {
                                NewsListView(newsViewModel: newsViewModel)
                            }.buttonStyle(PlainButtonStyle())
                        }

        }.navigationViewStyle(DefaultNavigationViewStyle())
    }
}

struct NewsViewMacContent_Previews: PreviewProvider {
    static var previews: some View {
        NewsViewMacContent()
    }
}
