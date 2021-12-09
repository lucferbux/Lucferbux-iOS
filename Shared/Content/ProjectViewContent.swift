//
//  ProjectViewContent.swift
//  lucferbux ios
//
//  Created by lucas fernández on 30/9/21.
//

import SwiftUI

struct ProjectViewContent: View {
    @ObservedObject var projectListViewModel = ProjectListViewModel()
    
    var body: some View {
            List(projectListViewModel.projectsViewModel) { projectListViewModel in
                NavigationLink(destination: iOSWebView(link: projectListViewModel.project.link ?? "https://lucferbux.dev")) {
                    ProjectRowView(projectViewModel: projectListViewModel)
                }
                .buttonStyle(.plain)
            }
    }
}

struct ProjectViewContent_Previews: PreviewProvider {
    static var previews: some View {
        ProjectViewContent()
    }
}
