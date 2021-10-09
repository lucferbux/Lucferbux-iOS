//
//  NewsListView.swift
//  lucferbux ios (macOS)
//
//  Created by lucas fernández on 4/10/21.
//

import SwiftUI

struct NewsListView: View {
    var newsViewModel: NewsViewModel
    
    var body: some View {
        HStack(alignment: .top, spacing: 10.0) {
            AsyncImageCustom(
                url: URL(string: newsViewModel.news.image)!,
                placeholder: { Image("LoadingPlaceholder").resizable() },
                image: {
                    Image(nsImage: $0).resizable()
                }
            )
             .clipped()
             .aspectRatio(contentMode: .fill)
             .frame(width: 36, height: 28)
             .cornerRadius(4)
             .padding(.top, 2)
        
            
            VStack(alignment: .leading, spacing: 4.0) {
                Text(newsViewModel.news.title_en ?? "")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text(newsViewModel.news.getDate())
                    .font(.footnote)
            }
        }
        .padding(.vertical, 4)
        
    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        let news = newsListMock[0]
        NewsListView(newsViewModel: NewsViewModel(news: news))
    }
}
