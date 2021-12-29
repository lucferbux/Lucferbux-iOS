//
//  PostsView.swift
//  lucferbux ios (macOS)
//
//  Created by lucas fernández on 29/9/21.
//

import SwiftUI

struct PostsDetailView: View {
    

    var body: some View {
        PostListDetailContent()
            .navigationTitle("Posts")
    }
    
}

struct PostsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostsDetailView()
    }
}
