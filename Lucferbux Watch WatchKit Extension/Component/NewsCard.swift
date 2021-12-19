//
//  NewsCard.swift
//  Lucferbux Watch WatchKit Extension
//
//  Created by Lucas Fernández Aragón on 10/12/21.
//

import SwiftUI

struct NewsCard: View {
    var news: News
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            HStack(alignment: .top) {
                AsyncImageCustom(
                    url: URL(string: news.image)!,
                    placeholder: { Image("LoadingPlaceholder").resizable() },
                    image: {
                        Image(uiImage: $0).resizable()
                    }
                )
                 .clipped()
                 .aspectRatio(contentMode: .fill)
                 .frame(width: 80, height: 50)
                 .cornerRadius(4)
                 .padding(.top, 2)
                Spacer()
                Text(news.getDate())
                    .font(.footnote)
            }
            
            Text(news.title ?? "")
                .fontWeight(.bold)
        }
        .padding(.vertical, 4)
    }
}

struct NewsCard_Previews: PreviewProvider {
    static var previews: some View {
        let news = newsList[0]
        NewsCard(news: news)
    }
}
