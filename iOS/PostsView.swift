//
//  PostsView.swift
//  lucferbux ios (iOS)
//
//  Created by lucas fernández on 29/9/21.
//

import SwiftUI

struct PostsView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    
    var body: some View {
        if horizontalSizeClass == .compact {
            PostListContent()
                .background(Color("Background Body"))
                .navigationTitle("Posts")
        } else {
            PostCardContent()
                .background(Color("Background Body"))
                .navigationTitle("Posts")
        }
    }
}

struct PostsView_Previews: PreviewProvider {
    static var previews: some View {
        PostsView()
    }
}
