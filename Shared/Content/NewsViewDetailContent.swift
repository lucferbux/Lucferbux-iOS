//
//  NewsViewDetailContent.swift
//  lucferbux ios
//
//  Created by lucas fernández on 2/10/21.
//

import SwiftUI

struct NewsViewDetailContent: View {
    var newsViewModel: NewsViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 14) {
                VStack(alignment: .leading, spacing: 4)  {
                    Text(newsViewModel.news.title_en ?? "")
                        .font(.largeTitle)
                        
                        .fontWeight(.bold)
                        
                    Text(newsViewModel.news.getDate())
                        .font(.callout)
                }
                
                AsyncImageCustom(
                    url: URL(string: newsViewModel.news.image)!,
                    placeholder: { Image("LoadingPlaceholder").resizable() },
                    image: {
                        #if os(iOS)
                        Image(uiImage: $0).resizable()
                        #else
                        Image(nsImage: $0).resizable()
                        #endif
                    }
                ).aspectRatio(contentMode: .fit)
                    .cornerRadius(6)
                Text(newsViewModel.news.description_en ?? "")
                #if os(macOS)
                    .font(.title3)
                    .lineSpacing(6)
                #endif
            }
            .frame(maxWidth: 700)
            .padding(.horizontal)
            #if os(macOS)
            .padding(.top)
            #endif
                
        }
        #if os(iOS)
        .navigationBarTitle("", displayMode: .inline)
        #endif
        
    }
}

struct NewsViewDetailContent_Previews: PreviewProvider {
    static var previews: some View {
        let news = newsListMock[0]
        NewsViewDetailContent(newsViewModel: NewsViewModel(news: news))
    }
}
