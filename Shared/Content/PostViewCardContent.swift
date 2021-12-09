//
//  PostViewCardContent.swift
//  lucferbux ios
//
//  Created by lucas fernández on 6/10/21.
//

import SwiftUI

struct PostViewCardContent: View {
    @ObservedObject var postListViewModel = PostListViewModel()
    
    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: [GridItem(.adaptive(minimum: 300), spacing: 20)],
                spacing: 20) {
                    ForEach(postListViewModel.postViewModel) { postViewModel in
                        NavigationLink(destination: iOSWebView(link: postViewModel.post.link ?? "https://lucferbux.dev")) {
                            PostCardView(postViewModel: postViewModel)
                        }
                        .buttonStyle(.plain)
                    }
            }.padding(.horizontal)
        }
    }
}

struct PostViewCardContent_Previews: PreviewProvider {
    static var previews: some View {
        PostViewCardContent()
    }
}
