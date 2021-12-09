//
//  PostWebView.swift
//  Lucferbux (macOS)
//
//  Created by Lucas Fernández Aragón on 8/12/21.
//

import SwiftUI

struct MacWebView: View {
    var link: String = ""
    
    @State private var state = WebViewState.empty
    @State private var action = WebViewAction.idle
    
    init(link: String) {
        self.link = link
        if let url = URL(string: link) {
            _action = State(initialValue: .load(URLRequest(url: url)))
        }
    }
    
    var body: some View {
        ZStack {
            WebView(action: $action,
                    state: $state)
            if (state.isLoading) {
                LottieViewMac(filename: "Loading")
                    .frame(width: 300, height: 300)
                
            }
        }.toolbar() {
            Button(action: {
                if let url = URL(string: link) {
                    NSWorkspace.shared.open(url)
                }
            }) {
                Image(systemName: "safari")
            }
        }
    }
}

struct PostWebView_Previews: PreviewProvider {
    static var previews: some View {
        MacWebView(link: "https:lucferbux.dev")
    }
}
