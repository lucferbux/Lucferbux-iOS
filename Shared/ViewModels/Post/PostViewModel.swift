//
//  PostViewModel.swift
//  lucferbux ios
//
//  Created by lucas fernández on 6/10/21.
//

import Foundation
import Combine


class PostViewModel: ObservableObject, Identifiable, Hashable {
    
    static func == (lhs: PostViewModel, rhs: PostViewModel) -> Bool {
        return lhs._id == rhs._id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(_id)
    }
    
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
