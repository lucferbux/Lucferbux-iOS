//
//  NewsDetailView.swift
//  Lucferbux (iOS)
//
//  Created by Lucas Fernández Aragón on 29/12/21.
//

import SwiftUI

struct NewsDetailView: View {
    var body: some View {
        NewsListDetailContent()
            .navigationTitle("Home")
    }
}

struct NewsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailView()
    }
}
