//
//  CompactButton.swift
//  lucferbux ios (macOS)
//
//  Created by lucas fernández on 8/10/21.
//

import SwiftUI

struct SquareButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(8)
            .background(Color("AccentColor"))
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

struct CompactButton: View {
    @Environment(\.openURL) var openURL
    var link: LinkButton
    
    var body: some View {
        Button(action: {
            openURL(URL(string: link.link!)!)
        }) {
            Image(link.name ?? "")
                .resizable()
                .aspectRatio(1, contentMode: .fit)                
        }
            .buttonStyle(SquareButton())
            #if os(iOS)
            .buttonBorderShape(.automatic)
            .controlSize(.regular)
            #endif

    }
}

struct CompactButton_Previews: PreviewProvider {
    static var previews: some View {
        let link = LinkButton(name: "Linkedin", link: "https://www.linkedin.com/in/lucferbux/")
        CompactButton(link: link)
    }
}
