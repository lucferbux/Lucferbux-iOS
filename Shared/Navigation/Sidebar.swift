//
//  Sidebar.swift
//  lucferbux ios (iOS)
//
//  Created by lucas fernández on 29/9/21.
//

import SwiftUI

enum NavigationItem {
    case news
    case projects
    case posts
    case aboutme
}

struct Sidebar: View {
    @State var selection: Set<NavigationItem> = [.news]
    @State var searchText = ""
    
    var body: some View {
        NavigationView {
            #if os(iOS)
            sidebar
                .navigationTitle("Lucferbux")
            NewsView()
            #else
            sidebar
                .frame(minWidth: 100, idealWidth: 150, maxWidth: 200, maxHeight: .infinity)
                .padding(.top)
            NewsView()
                .padding()
            #endif
        
            
        }
    }
    
    var sidebar: some View {
        List(selection: $selection) {
            
            NavigationLink(destination: NewsView()) {
                Label("Home", systemImage: "house")
            }
            .tag(NavigationItem.news)
            
            if #available(macOS 12.0, iOS 15.0, *){
                NavigationLink(destination: ProjectsView()) {
                    Label("Projects", systemImage: "chevron.left.forwardslash.chevron.right")
                }
                .tag(NavigationItem.projects)
            } else {
                NavigationLink(destination: ProjectsView()) {
                    Label("Projects", systemImage: "laptopcomputer.and.iphone")
                }
                .tag(NavigationItem.projects)
            }
            
            NavigationLink(destination: PostsView()) {
                Label("Posts", systemImage: "books.vertical")
            }
            .tag(NavigationItem.posts)
            
            NavigationLink(destination: AboutMeView()) {
                Label("About Me", systemImage: "person")
            }
            .tag(NavigationItem.aboutme)
            
        
        }
        .listStyle(SidebarListStyle())
    }
}


struct MacView_Previews: PreviewProvider {
    static var previews: some View {
        Sidebar()
    }
}
