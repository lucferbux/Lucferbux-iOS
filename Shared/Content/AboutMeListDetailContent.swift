//
//  AboutMeListDetailContent.swift
//  Lucferbux
//
//  Created by Lucas Fernández Aragón on 29/12/21.
//

import SwiftUI

enum AboutMeNavigationContent {
    case lucas
}

struct AboutMeListDetailContent: View {
    @State var selection: Set<AboutMeNavigationContent> = [.lucas]
    @State private var isDefaultItemActive = true
    
    var body: some View {
            List(selection: $selection) {
                
                NavigationLink(destination: AboutMeContent(), isActive: $isDefaultItemActive) {
                    HStack(alignment: .center, spacing: 10.0) {
                        Image("Avatar")
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                            .frame(width: 28 ,height: 28)
                    
                        Text("Lucas Fernandez")
                    }
                    .padding(.vertical, 4)
                }.buttonStyle(PlainButtonStyle())
                
            }.listStyle(SidebarListStyle())
    }
}

struct AboutMeListDetailContent_Previews: PreviewProvider {
    static var previews: some View {
        AboutMeListDetailContent()
    }
}
