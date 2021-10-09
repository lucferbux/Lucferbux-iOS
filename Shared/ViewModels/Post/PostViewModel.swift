//
//  PostViewModel.swift
//  lucferbux ios
//
//  Created by lucas fernández on 6/10/21.
//

import Foundation
import Combine


class PostViewModel: ObservableObject, Identifiable {
    
    private let postRepository = PostsRepository()
    @Published var post: Post
    
    private var cancellables: Set<AnyCancellable> = []
    
    var _id = ""
    
    init(post: Post) {
        self.post = post
        
        $post
            .compactMap { $0._id }
            .assign(to: \._id, on: self)
            .store(in: &cancellables)
    }
}
