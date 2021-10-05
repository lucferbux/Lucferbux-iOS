//
//  CardView.swift
//  lucferbux ios
//
//  Created by lucas fernández on 19/9/21.
//

import SwiftUI

struct NewsCardView: View {
    var newsViewModel: NewsViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
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
            VStack(alignment: .leading, spacing: 4.0) {
                Text(newsViewModel.news.title_en ?? "")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text(newsViewModel.news.getDate())
                    .font(.footnote)
            }
            .padding([.leading, .bottom, .trailing])
        }
        .background(Color("Background 2"))
        .cornerRadius(20.0)
        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}

struct NewsCardView_Previews: PreviewProvider {
    static var previews: some View {
        let news = newsListMock[0]
        NewsCardView(newsViewModel: NewsViewModel(news: news))
    }
}
