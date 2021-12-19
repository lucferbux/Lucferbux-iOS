//
//  ProjectViewContent.swift
//  lucferbux ios
//
//  Created by lucas fernández on 30/9/21.
//

import SwiftUI

struct ProjectViewContent: View {
    @ObservedObject var projectListViewModel = ProjectListViewModel()
    @State private var searchText = ""
    
    var body: some View {
            List(searchResults) { projectListViewModel in
                NavigationLink(destination: iOSWebView(link: projectListViewModel.project.link ?? "https://lucferbux.dev")) {
                    ProjectRowView(projectViewModel: projectListViewModel)
                }
                .searchable(text: $searchText)
                .buttonStyle(.plain)
            }
    }
    
    var searchResults: [ProjectViewModel] {
            if searchText.isEmpty {
                return projectListViewModel.projectsViewModel
            } else {
                return projectListViewModel.projectsViewModel.filter { $0.project.title!.contains(searchText) }
            }
        }
}

struct ProjectViewContent_Previews: PreviewProvider {
    static var previews: some View {
        ProjectViewContent()
    }
}
