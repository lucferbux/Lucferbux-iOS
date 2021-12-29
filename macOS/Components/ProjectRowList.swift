//
//  ProjectListView.swift
//  Lucferbux (macOS)
//
//  Created by Lucas Fernández Aragón on 9/12/21.
//

import SwiftUI

struct ProjectRowList: View {
    var projectViewModel: ProjectViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(alignment: .center, spacing: 10.0) {
                VStack(alignment: .leading, spacing: 4.0) {
                    Text(projectViewModel.project.title_en ?? "")
                        .fontWeight(.bold)
                    Text(projectViewModel.project.tags ?? "-")
                        .font(.footnote)
                }
                Spacer()
                Text(projectViewModel.project.version ?? "0.0.0")
                    .font(.footnote)
                    .fontWeight(.light)
            }
            Text(projectViewModel.project.description_en ?? "")
                .lineLimit(3)
        }.padding(.vertical, 4)
        
    }
}

struct ProjectListView_Previews: PreviewProvider {
    static var previews: some View {
        let project = projectListMock[0]
        ProjectRowList(projectViewModel: ProjectViewModel(project: project))
    }
}
