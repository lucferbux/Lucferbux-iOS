//
//  NewsData.swift
//  Lucferbux Watch WatchKit Extension
//
//  Created by Lucas Fernández Aragón on 13/12/21.
//

import Foundation
import Combine

class NewsData: ObservableObject {
  static var shared = NewsData()
  private(set) var news: [News] = []

  init(news: [News] = []) {
    self.news = news
  }


  func nextNews(from date: Date) -> News? {
      return self.news.randomElement()!
  }

  func news(after date: Date) -> [News] {
    return self.news
  }

}
