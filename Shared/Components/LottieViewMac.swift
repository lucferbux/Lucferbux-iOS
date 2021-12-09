//
//  LottieViewMac.swift
//  Lucferbux (macOS)
//
//  Created by Lucas Fernández Aragón on 9/12/21.
//

import SwiftUI
import Lottie

struct LottieViewMac: NSViewRepresentable {
    let animationView = AnimationView()
    var filename = "LottieLogo2"
    
    func makeNSView(context: NSViewRepresentableContext<LottieViewMac>) -> NSView {
        let view = NSView()
        
        let animation = Animation.named(filename)
        animationView.animation = animation
        animationView.loopMode = .loop
        animationView.contentMode = .scaleAspectFit
        animationView.play()
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        return view
    }
    
    func updateNSView(_ uiView: NSView, context: NSViewRepresentableContext<LottieViewMac>) {
    }
}
