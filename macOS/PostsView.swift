//
//  PostsView.swift
//  lucferbux ios (macOS)
//
//  Created by lucas fernández on 29/9/21.
//

import SwiftUI

struct PostsView: View {

    var body: some View {
        PostViewContent()
            .navigationTitle("Posts")
    }
}

struct PostsView_Previews: PreviewProvider {
    static var previews: some View {
        PostsView()
    }
}
