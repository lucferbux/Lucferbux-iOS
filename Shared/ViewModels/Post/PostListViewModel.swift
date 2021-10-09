//
//  PostListViewModel.swift
//  lucferbux ios
//
//  Created by lucas fernández on 6/10/21.
//

import Foundation
import Combine

class PostListViewModel: ObservableObject {
    
    @Published var postViewModel: [PostViewModel] = []
    private var cancellables: Set<AnyCancellable> = []
    
    @Published var postRepository = PostsRepository()
    
    init() {
        postRepository.$posts.map { post in
            post.map(PostViewModel.init)
        }
        .assign(to: \.postViewModel, on: self)
        .store(in: &cancellables)
    }
}
