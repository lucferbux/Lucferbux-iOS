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
                PostViewRow(postViewModel: postViewModel)
            }
        }
            
            
    }
}

struct PostViewContent_Previews: PreviewProvider {
    static var previews: some View {
        PostViewContent()
    }
}
