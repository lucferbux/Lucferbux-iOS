//
//  ProjectViewContent.swift
//  lucferbux ios
//
//  Created by lucas fernández on 30/9/21.
//

import SwiftUI

struct ProjectViewContent: View {
    @ObservedObject var projectListViewModel = ProjectListviewModel()
    
    var body: some View {

            List(projectListViewModel.projectsViewModel) { projectListViewModel in
                ProjectRowView(projectViewModel: projectListViewModel)

            }
        
    }
}

struct ProjectViewContent_Previews: PreviewProvider {
    static var previews: some View {
        ProjectViewContent()
    }
}
