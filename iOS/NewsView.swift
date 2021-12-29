//
//  NewsView.swift
//  lucferbux ios (iOS)
//
//  Created by lucas fernández on 29/9/21.
//

import SwiftUI

struct NewsView: View {    
    var body: some View {
        NewsCardContent()
            .background(Color("Background Body"))
            .navigationTitle("Home")
    }
    
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
