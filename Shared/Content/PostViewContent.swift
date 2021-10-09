//
//  PostViewContent.swift
//  lucferbux ios
//
//  Created by lucas fernández on 6/10/21.
//

import SwiftUI

struct PostViewContent: View {
    @ObservedObject var postListViewModel = PostListViewModel()
    
    var body: some View {
        ScrollView{
            ForEach(postListViewModel.postViewModel) { postViewModel in
                #if os(iOS)
                PostViewRow(postViewModel: postViewModel)
                #else
                HStack {
                    Spacer()
                    PostRowViewMac(postViewModel: postViewModel)
                    Spacer()
                }
                #endif
            }
            #if os(macOS)
            .padding(.top)
            #endif
        }
            
            
    }
}

struct PostViewContent_Previews: PreviewProvider {
    static var previews: some View {
        PostViewContent()
    }
}
