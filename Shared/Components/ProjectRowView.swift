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
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Text(projectViewModel.project.title ?? "")
                    .font(.headline)
                Spacer()
                Text(projectViewModel.project.version ?? "0.0.0")
                    .font(.footnote)
            }
            Text(projectViewModel.project.tags ?? "-")
                .font(.subheadline)
            Text(projectViewModel.project.description ?? "")
                .font(.body)
        }
        #if os(macOS)
        .padding()
        #endif
        
        
    }
}

struct ProjectRowView_Previews: PreviewProvider {
    static var previews: some View {
        let project = projectListMock[0]
        ProjectRowView(projectViewModel: ProjectViewModel(project: project))
    }
}
