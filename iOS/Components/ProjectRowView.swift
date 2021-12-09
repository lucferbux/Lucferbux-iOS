//
//  ProjectRowView.swift
//  lucferbux ios
//
//  Created by lucas fernández on 30/9/21.
//

import SwiftUI


struct ProjectRowView: View {
    var projectViewModel: ProjectViewModel
    
    var body: some View {
            VStack(alignment: .leading, spacing: 10) {
                VStack(alignment: .leading, spacing: 2) {
                    HStack {
                        Text(projectViewModel.project.title ?? "")
                            .font(.headline)
                        Spacer()
                        Text(projectViewModel.project.version ?? "0.0.0")
                            .font(.footnote)
                            .fontWeight(.light)
                            
                    }
                    Text(projectViewModel.project.tags ?? "-")
                        .font(.subheadline)
                        .fontWeight(.light)
                }
                Text(projectViewModel.project.description ?? "")
                    .font(.body)
            }
            .padding(.vertical, 8)
    }
}

struct ProjectRowView_Previews: PreviewProvider {
    static var previews: some View {
        let project = projectListMock[0]
        ProjectRowView(projectViewModel: ProjectViewModel(project: project))
    }
}
