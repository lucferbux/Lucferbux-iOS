//
//  PostListView.swift
//  Lucferbux (macOS)
//
//  Created by Lucas Fernández Aragón on 8/12/21.
//

import SwiftUI

struct PostRowList: View {
    var postViewModel: PostViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(alignment: .top, spacing: 10.0) {
                AsyncImageCustom(
                    url: URL(string: postViewModel.post.image)!,
                    placeholder: { Image("LoadingPlaceholder").resizable() },
                    image: {
                        #if os(iOS)
                        Image(uiImage: $0).resizable()
                        #else
                        Image(nsImage: $0).resizable()
                        #endif
                    }
                )
                 .clipped()
                 .aspectRatio(contentMode: .fill)
                 .frame(width: 40, height: 34)
                 .cornerRadius(4)
                 .padding(.top, 2)
            
                
                VStack(alignment: .leading, spacing: 4.0) {
                    Text(postViewModel.post.title_en ?? "")
                        .fontWeight(.bold)
                    Text(postViewModel.post.getDate())
                        .font(.footnote)
                }
            }
            Text(postViewModel.post.description_en ?? "")
                .lineLimit(3)
        }.padding(.vertical, 4)
        
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        let post = postListMock[0]
        PostRowList(postViewModel: PostViewModel(post: post))
    }
}
