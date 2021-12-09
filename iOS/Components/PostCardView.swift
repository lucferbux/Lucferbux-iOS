//
//  PostCardView.swift
//  lucferbux ios
//
//  Created by lucas fernández on 6/10/21.
//

import SwiftUI

struct PostCardView: View {
    var postViewModel: PostViewModel
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
            ZStack {
                GeometryReader{geo in
                    AsyncImageCustom(
                        url: URL(string: postViewModel.post.image)!,
                        placeholder: { Image("LoadingImage").resizable() },
                        image: {
                            #if os(iOS)
                            Image(uiImage: $0).resizable()
                            #else
                            Image(nsImage: $0).resizable()
                            #endif
                        }
                    )
                    .aspectRatio(contentMode: .fill)
                    .frame(height: geo.size.height)
                }.blur(radius: 20)
                    .brightness(colorScheme == .dark ? -0.3 : 0.5)
                    
                
                
                VStack(alignment: .leading, spacing: 4.0) {
                    Text(postViewModel.post.title_en ?? "")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text(postViewModel.post.getDate())
                        .font(.caption)
                        .fontWeight(.light)
                    Text(postViewModel.post.description_en ?? "")
                        .font(.footnote)
                        
                }.padding(10)
            }.aspectRatio(1.74, contentMode: .fit)
            .background(Color("Background 2"))
            .cornerRadius(20.0)
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}

struct PostCardView_Previews: PreviewProvider {
    static var previews: some View {
        let postViewModel = PostViewModel(post: postListMock[0])
        PostCardView(postViewModel: postViewModel)
    }
}
