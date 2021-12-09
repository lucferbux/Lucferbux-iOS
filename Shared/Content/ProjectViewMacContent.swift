//
//  ProjectViewMacContent.swift
//  Lucferbux (macOS)
//
//  Created by Lucas Fernández Aragón on 9/12/21.
//

import SwiftUI

struct ProjectViewMacContent: View {
    @ObservedObject var projectListViewModel = ProjectListViewModel()
    
    var body: some View {
        NavigationView {
            List(projectListViewModel.projectsViewModel) { projectsViewModel in
                NavigationLink(destination: MacWebView(link: projectsViewModel.project.link!)) {
                    ProjectListView(projectViewModel: projectsViewModel)
                }.buttonStyle(PlainButtonStyle())
                    
                
            }
        }.navigationViewStyle(DefaultNavigationViewStyle())
    }
}

struct ProjectViewMacContent_Previews: PreviewProvider {
    static var previews: some View {
        ProjectViewMacContent()
    }
}
