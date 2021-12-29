//
//  TabBar.swift
//  lucferbux ios
//
//  Created by lucas fernández on 19/9/21.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            NavigationView {
                NewsView()
            }
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            
            NavigationView {
                ProjectsView()
            }
            .tabItem {
                Image(systemName: "chevron.left.forwardslash.chevron.right")
                Text("Projects")
            }
            
            NavigationView {
                PostsView()
            }
            .tabItem {
                Image(systemName: "books.vertical")
                Text("Posts")
            }
            
            NavigationView {
                AboutMeView()
            }
            .tabItem {
                Image(systemName: "person")
                Text("About Authors")
            }
            
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
