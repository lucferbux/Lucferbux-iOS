//
//  NewsListDetailContent.swift
//  Lucferbux
//
//  Created by Lucas Fernández Aragón on 29/12/21.
//

import SwiftUI

struct NewsListDetailContent: View {
    @ObservedObject var newsListViewModel = NewsListViewModel()
    @State var selection: NewsViewModel?
    
    var body: some View {
        List(selection: $selection){
            ForEach(newsListViewModel.newsViewModels) { newsViewModel in
                            NavigationLink(
                                destination: NewsDetailContent(newsViewModel: newsViewModel),
                                tag: newsViewModel,
                                selection: self.$selection
                            ) {
                                NewsListView(newsViewModel: newsViewModel)
                            }.buttonStyle(PlainButtonStyle())
                    
            }.onAppear {
                if self.selection == nil {
                    self.selection = newsListViewModel.newsViewModels.first
                }
            }
        }.listStyle(SidebarListStyle())
            
    }
}

struct NewsListDetailContent_Previews: PreviewProvider {
    static var previews: some View {
        NewsListDetailContent()
    }
}
