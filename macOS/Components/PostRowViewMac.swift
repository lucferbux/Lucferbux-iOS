//
//  PostRowViewMac.swift
//  lucferbux ios (macOS)
//
//  Created by lucas fernández on 7/10/21.
//

import SwiftUI

struct PostRowViewMac: View {
    var postViewModel: PostViewModel
    
    var body: some View {
        HStack(alignment: .top, spacing: 8.0) {
                VStack(alignment: .leading, spacing: 4.0) {
                    Text(postViewModel.post.title_en ?? "")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text(postViewModel.post.getDate())
                        .font(.footnote)
                        .fontWeight(.light)
                    Text(postViewModel.post.description_en ?? "")
                        .font(.body)
                    
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
        }.onTapGesture {
            guard let urlOpen = URL(string: postViewModel.post.link ?? "https://lucferbux.dev") else  {
                return
            }
            NSWorkspace.shared.open(urlOpen)
        }
        .padding()
        .frame(maxWidth: 700)
        .background(Color("Background 3"))
        .cornerRadius(8.0)

        
        
    }
}

struct PostRowViewMac_Previews: PreviewProvider {
    static var previews: some View {
        let post = postListMock[0]
        PostRowViewMac(postViewModel: PostViewModel(post: post))
    }
}
