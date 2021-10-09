//
//  PostsRepository.swift
//  lucferbux ios
//
//  Created by lucas fernández on 6/10/21.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

class PostsRepository:  ObservableObject {
    
    private let path: String = "patent"
    private let store = Firestore.firestore()
    @Published var posts: PostList = []
    
    init() {
        loadPosts()
    }
    
    func loadPosts() {
        store.collection(path).order(by: "date", descending: true).addSnapshotListener { (querySnapshot, error) in
            
            if let error = error {
                print("Error getting projects: \(error.localizedDescription)")
                return
              }
                        
            let posts = querySnapshot?.documents.compactMap { document in
                try? document.data(as: Post.self)
            } ?? []
                        
            DispatchQueue.main.async {
                self.posts = posts
            }
        }
    }
}
