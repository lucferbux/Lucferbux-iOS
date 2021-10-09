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
            #if os(iOS)
            List(projectListViewModel.projectsViewModel) { projectListViewModel in
                ProjectRowView(projectViewModel: projectListViewModel)
            }
            #else
            ScrollView{
                ForEach(projectListViewModel.projectsViewModel) { projectListViewModel in
                    HStack {
                        Spacer()
                        ProjectRowViewMac(projectViewModel: projectListViewModel)
                        Spacer()
                    }
                }.padding(.top)
            }
            #endif
    }
}

struct ProjectViewContent_Previews: PreviewProvider {
    static var previews: some View {
        ProjectViewContent()
    }
}
