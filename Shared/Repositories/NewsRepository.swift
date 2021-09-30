//
//  FirebaseService.swift
//  LucferbuxIos
//
//  Created by lucas fernández on 15/04/2020.
//  Copyright © 2020 lucas fernández. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

class NewsRepository:  ObservableObject {
    
    private let path: String = "intro"
    private let store = Firestore.firestore()
    @Published var news: NewsList = []
    
    init() {
        loadNews()
    }
    
    func loadNews() {
        store.collection(path).order(by: "timestamp", descending: true).addSnapshotListener { (querySnapshot, error) in
            
            if let error = error {
                print("Error getting news: \(error.localizedDescription)")
                return
              }
                        
            let news = querySnapshot?.documents.compactMap { document in
                try? document.data(as: News.self)
            } ?? []
                        
            DispatchQueue.main.async {
                self.news = news
            }
        }
    }
    

}

