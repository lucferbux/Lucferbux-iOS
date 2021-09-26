//
//  NewsViewModel.swift
//  lucferbux ios
//
//  Created by lucas fernández on 26/9/21.
//

import Foundation
import Combine

class NewsViewModel: ObservableObject, Identifiable {
    
    private let newsRepository = NewsRepository()
    @Published var news: News
    
    private var cancellables: Set<AnyCancellable> = []
    
    var _id = ""
    
    init(news: News) {
        self.news = news
        
        $news
            .compactMap { $0._id }
            .assign(to: \._id, on: self)
            .store(in: &cancellables)
    }
    
}
