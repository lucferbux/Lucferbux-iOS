//
//  NewsViewList.swift
//  lucferbux ios
//
//  Created by lucas fernández on 26/9/21.
//

import SwiftUI

struct NewsViewList: View {
    @ObservedObject var newsListViewModel = NewsListViewModel()
    
    
    var body: some View {
        ScrollView {
            VStack (spacing: 20){
                ForEach(newsListViewModel.newsViewModels) { newsViewModel in
                    CardView(newsViewModel: newsViewModel)
                }
            }
            .padding()
        }
                    
    }
}

struct NewsViewList_Previews: PreviewProvider {
    static var previews: some View {
        NewsViewList()
    }
}
