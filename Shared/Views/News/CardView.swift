//
//  CardView.swift
//  lucferbux ios
//
//  Created by lucas fernández on 19/9/21.
//

import SwiftUI

struct CardView: View {
    var newsViewModel: NewsViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: newsViewModel.news.image)) { phase in
                        switch phase {
                        case .empty:
                            Image("LoadingPlaceholder").resizable()
                                .aspectRatio(contentMode: .fit)
                        case .success(let image):
                            image.resizable()
                                 .aspectRatio(contentMode: .fit)
                        case .failure:
                            Image("LoadingPlaceholder").resizable()
                                .aspectRatio(contentMode: .fit)
                        @unknown default:
                            // Since the AsyncImagePhase enum isn't frozen,
                            // we need to add this currently unused fallback
                            // to handle any new cases that might be added
                            // in the future:
                            
                            Image("LoadingPlaceholder").resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                    }
            VStack(alignment: .leading, spacing: 4.0) {
                Text(newsViewModel.news.title ?? "")
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

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let news = newsListMock[0]
        CardView(newsViewModel: NewsViewModel(news: news))
    }
}
