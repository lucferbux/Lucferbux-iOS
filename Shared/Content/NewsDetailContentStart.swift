//
//  NewsDetailContentStart.swift
//  Lucferbux
//
//  Created by Lucas Fernández Aragón on 29/12/21.
//

import SwiftUI

struct NewsDetailContentStart: View {
    @ObservedObject var newsListViewModel = NewsListViewModel()
    
    var body: some View {
        if(newsListViewModel.newsViewModels.first != nil) {
            NewsDetailContent(newsViewModel: newsListViewModel.newsViewModels.first!)
        } else {
            Text("")
        }
            
    }
}

struct NewsDetailContentStart_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailContentStart()
    }
}
