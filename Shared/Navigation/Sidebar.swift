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
    @State private var isDefaultItemActive = true
    @State var selection: Set<NavigationItem> = [.news]
    @State var searchText = ""
    @ObservedObject var newsListViewModel = NewsListViewModel()
    @State var detailedSelection: NewsViewModel?
    
    var body: some View {
        NavigationView {
            #if os(iOS)
            SideBarView
                .navigationTitle("Lucferbux")
//                .toolbar {
//                        ToolbarItem(placement: .navigationBarLeading) {
//                            Button(action: {
//                                UIApplication.shared.setFirstSplitViewPreferredDisplayMode(.oneBesideSecondary)
//                            }) {
//                                Image(systemName: "sidebar.left")
//                            }
//                        }
//
//                    }
            
            NewsDetailView()
            NewsDetailContentStart()
            #else
            SideBarView
                .frame(minWidth: 150)
                .padding(.top)
                .toolbar {
                        Button(action: toggleSidebar) {
                            Image(systemName: "sidebar.left")
                                .help("Toggle Sidebar")
                            }
                }
                    
            NewsDetailView()
                .padding()
            NewsDetailContentStart()
            #endif
        }
    }
    
    #if os(macOS)
    private func toggleSidebar() {
        NSApp.keyWindow?.firstResponder?
            .tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
    }
    #endif
    
    var SideBarView: some View {
        
        
        List(selection: $selection) {
            
            NavigationLink(destination: NewsDetailView(), isActive: $isDefaultItemActive) {
                Label("Home", systemImage: "house")
            }
            .tag(NavigationItem.news)
            
            if #available(macOS 12.0, iOS 15.0, *){
                NavigationLink(destination: ProjectsDetailView()) {
                    Label("Projects", systemImage: "chevron.left.forwardslash.chevron.right")
                }
                .tag(NavigationItem.projects)
            } else {
                NavigationLink(destination: ProjectsDetailView()) {
                    Label("Projects", systemImage: "laptopcomputer.and.iphone")
                }
                .tag(NavigationItem.projects)
            }
            
            NavigationLink(destination: PostsDetailView()) {
                Label("Posts", systemImage: "books.vertical")
            }
            .tag(NavigationItem.posts)
            
            NavigationLink(destination: AboutMeDetailView()) {
                Label("About Authors", systemImage: "person")
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


// MARK: - Consistency with iPad
#if canImport(UIKit)
public extension UIApplication {
    func setFirstSplitViewPreferredDisplayMode(_ preferredDisplayMode: UISplitViewController.DisplayMode) {
        var splitViewController: UISplitViewController? {
            UIApplication.shared.firstSplitViewController
        }
        
        // Sometimes split view is not available instantly
        if let splitViewController = splitViewController {
            UIView.animate(withDuration: 0.3, delay: 0, options: []) {
                            splitViewController.preferredDisplayMode = preferredDisplayMode
                        } completion: { _ in }
        } else {
            DispatchQueue.main.async {
                            UIView.animate(withDuration: 0.3, delay: 0, options: []) {
                                splitViewController?.preferredDisplayMode = preferredDisplayMode
                            } completion: { _ in }
                        }
        }
    }
    
    private var firstSplitViewController: UISplitViewController? {
        windows.first { $0.isKeyWindow }?
            .rootViewController?.firstSplitViewController
    }
}

private extension UIViewController {
    var firstSplitViewController: UISplitViewController? {
        self as? UISplitViewController
            ?? children.lazy.compactMap { $0.firstSplitViewController }.first
    }
}
#endif
