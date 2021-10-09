//
//  PostViewrow.swift
//  lucferbux ios
//
//  Created by lucas fernández on 6/10/21.
//

import SwiftUI

struct PostViewRow: View {
    var postViewModel: PostViewModel
    
    var body: some View {
        
        
        Link(destination: URL(string: postViewModel.post.link ?? "https://lucferbux.dev")!) {
            VStack(alignment: .leading, spacing: 8.0) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 4.0) {
                        Text(postViewModel.post.title_en ?? "")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        Text(postViewModel.post.getDate())
                            .font(.footnote)
                            .fontWeight(.light)
                        
                    }
                    Spacer()
                    
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
                     .frame(width: 100, height: 65)
                     .cornerRadius(8)
                     .padding(.top, 2)
                    
                }
                Text(postViewModel.post.description_en ?? "")
                    .font(.body)
            }.padding()
        }.buttonStyle(PlainButtonStyle())
            .background(Color("Background Cell"))
            .cornerRadius(20)
            .padding(.horizontal)
            

        
    }
}

struct PostViewRow_Previews: PreviewProvider {
    static var previews: some View {
        let postViewModel = PostViewModel(post: postListMock[0])
        PostViewRow(postViewModel: postViewModel)
            .preferredColorScheme(.dark)
    }
}
