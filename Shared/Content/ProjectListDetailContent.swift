//
//  ProjectViewMacContent.swift
//  Lucferbux (macOS)
//
//  Created by Lucas Fernández Aragón on 9/12/21.
//

import SwiftUI

struct ProjectListDetailContent: View {
    @ObservedObject var projectListViewModel = ProjectListViewModel()
    @State var selection: ProjectViewModel?
    
    var body: some View {
        List(selection: $selection) {
            ForEach(projectListViewModel.projectsViewModel) { projectsViewModel in
                #if os(iOS)
                NavigationLink(destination: iOSWebView(link: projectsViewModel.project.link!),
                   tag: projectsViewModel,
                   selection: self.$selection
                ) {
                    ProjectRowList(projectViewModel: projectsViewModel)
                }.buttonStyle(PlainButtonStyle())
                #else
                NavigationLink(destination: MacWebView(link: projectsViewModel.project.link!),
                               tag: projectsViewModel,
                               selection: self.$selection) {
                    ProjectRowList(projectViewModel: projectsViewModel)
                }.buttonStyle(PlainButtonStyle())
                #endif
                    
            }.onAppear {
                if self.selection == nil {
                    self.selection = projectListViewModel.projectsViewModel.first
                }
            }
        }.listStyle(SidebarListStyle())
            
    }
}

struct ProjectViewMacContent_Previews: PreviewProvider {
    static var previews: some View {
        ProjectListDetailContent()
    }
}
