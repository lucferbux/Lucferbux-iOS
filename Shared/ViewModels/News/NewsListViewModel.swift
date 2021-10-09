//
//  NewsViewModel.swift
//  lucferbux ios
//
//  Created by lucas fernández on 26/9/21.
//

import Foundation

import Combine

class NewsListViewModel: ObservableObject {
    
    @Published var newsViewModels: [NewsViewModel] = []
    private var cancellables: Set<AnyCancellable> = []
    
    @Published var newsRepository = NewsRepository()
    
    init() {
        newsRepository.$news.map { news in
            news.map(NewsViewModel.init)
        }
        .assign(to: \.newsViewModels, on: self)
        .store(in: &cancellables)
    }
    
    
    
}
