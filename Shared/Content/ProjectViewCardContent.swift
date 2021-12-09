//
//  ProjectViewCardContent.swift
//  lucferbux ios
//
//  Created by lucas fernández on 1/10/21.
//

import SwiftUI

struct ProjectViewCardContent: View {
    @ObservedObject var projectListViewModel = ProjectListViewModel()
    
    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: [GridItem(.adaptive(minimum: 300), spacing: 20)],
                spacing: 20) {
                    ForEach(projectListViewModel.projectsViewModel) { projectListViewModel in
                        ProjectCardView(projectViewModel: projectListViewModel)
                    }
            }.padding(.horizontal)
        }
    }
}

struct ProjectViewCardContent_Previews: PreviewProvider {
    static var previews: some View {
        ProjectViewCardContent()
    }
}


