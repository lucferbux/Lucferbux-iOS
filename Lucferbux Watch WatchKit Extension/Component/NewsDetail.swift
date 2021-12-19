//
//  NewsDetail.swift
//  Lucferbux Watch WatchKit Extension
//
//  Created by Lucas Fernández Aragón on 10/12/21.
//

import SwiftUI

struct NewsDetail: View {
    var news: News
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 14) {
                VStack(alignment: .leading, spacing: 4)  {
                    Text(news.title ?? "")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text(news.getDate())
                        .font(.callout)
                }
                
                AsyncImageCustom(
                    url: URL(string: news.image)!,
                    placeholder: { Image("LoadingPlaceholder").resizable() },
                    image: {
                        Image(uiImage: $0).resizable()
                    }
                ).aspectRatio(contentMode: .fit)
                    .cornerRadius(6)
                Text(news.description ?? "")
            }
            .frame(maxWidth: 700)
            .padding(.horizontal)

                
        }
        .navigationTitle("")
    }
}

struct NewsDetail_Previews: PreviewProvider {
    static var previews: some View {
        let news = newsList[0]
        NewsDetail(news:  news)
    }
}
