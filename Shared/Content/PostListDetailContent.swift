//
//  PostViewMacContent.swift
//  Lucferbux
//
//  Created by Lucas Fernández Aragón on 8/12/21.
//

import SwiftUI

struct PostListDetailContent: View {
    @ObservedObject var postListViewModel = PostListViewModel()
    @State var selection: PostViewModel?
    
    var body: some View {
        List(selection: $selection){
            ForEach(postListViewModel.postViewModel) { postViewModel in
                #if os(iOS)
                NavigationLink(destination: iOSWebView(link: postViewModel.post.link!),
                               tag: postViewModel,
                               selection: self.$selection) {
                    PostRowList(postViewModel: postViewModel)
                }.buttonStyle(PlainButtonStyle())
                #else
                NavigationLink(destination: MacWebView(link: postViewModel.post.link!),
                               tag: postViewModel,
                               selection: self.$selection) {
                    PostRowList(postViewModel: postViewModel)
                }.buttonStyle(PlainButtonStyle())
                #endif
                
            }.onAppear {
                if self.selection == nil {
                    self.selection = postListViewModel.postViewModel.first
                }
            }
        }.listStyle(SidebarListStyle())
            
    }
}

struct PostViewMacContent_Previews: PreviewProvider {
    static var previews: some View {
        PostListDetailContent()
    }
}
