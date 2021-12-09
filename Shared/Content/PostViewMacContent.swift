//
//  PostViewMacContent.swift
//  Lucferbux
//
//  Created by Lucas Fernández Aragón on 8/12/21.
//

import SwiftUI

struct PostViewMacContent: View {
    @ObservedObject var postListViewModel = PostListViewModel()
    
    var body: some View {
        NavigationView {
            List(postListViewModel.postViewModel) { postViewModel in
                NavigationLink(destination: MacWebView(link: postViewModel.post.link!)) {
                    PostListView(postViewModel: postViewModel)
                }.buttonStyle(PlainButtonStyle())
                
            }
        }.navigationViewStyle(DefaultNavigationViewStyle())
    }
}

struct PostViewMacContent_Previews: PreviewProvider {
    static var previews: some View {
        PostViewMacContent()
    }
}
