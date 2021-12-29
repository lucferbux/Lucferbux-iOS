//
//  ProjectViewCardContent.swift
//  lucferbux ios
//
//  Created by lucas fernández on 1/10/21.
//

import SwiftUI

struct ProjectCardContent: View {
    @ObservedObject var projectListViewModel = ProjectListViewModel()
    
    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: [GridItem(.adaptive(minimum: 300), spacing: 20)],
                spacing: 20) {
                    ForEach(projectListViewModel.projectsViewModel) { projectListViewModel in
                        NavigationLink(destination: iOSWebView(link: projectListViewModel.project.link ?? "https://lucferbux.dev")) {
                            ProjectCardView(projectViewModel: projectListViewModel)
                        }
                        .buttonStyle(.plain)
                    }
            }.padding(.horizontal)
        }
    }
}

struct ProjectViewCardContent_Previews: PreviewProvider {
    static var previews: some View {
        ProjectCardContent()
    }
}


