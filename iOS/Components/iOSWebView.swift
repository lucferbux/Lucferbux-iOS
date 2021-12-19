//
//  iOSWebView.swift
//  Lucferbux (iOS)
//
//  Created by Lucas Fernández Aragón on 9/12/21.
//

import SwiftUI

struct iOSWebView: View {
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
                    state: $state).opacity(state.isLoading ? 0 : 1)
            if (state.isLoading) {
                LottieView(filename: "Loading")
                    .frame(width: 300, height: 300)
            }
        }.navigationBarTitle("", displayMode: .inline)
            .toolbar() {
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        action = .goBack
                    }) {
                        Image(systemName: "chevron.backward")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        action = .goForward
                    }) {
                        Image(systemName: "chevron.forward")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        if let url = URL(string: link) {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        Image(systemName: "safari")
                    }
                }
            }
    }
}

struct iOSWebView_Previews: PreviewProvider {
    static var previews: some View {
        iOSWebView(link: "https://lucferbux.dev")
    }
}
