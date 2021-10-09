//
//  ProjectRowViewMac.swift
//  lucferbux ios (macOS)
//
//  Created by lucas fernández on 1/10/21.
//

import SwiftUI


struct ProjectRowViewMac: View {
    var projectViewModel: ProjectViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack(alignment: .leading, spacing: 2) {
                HStack {
                    Text(projectViewModel.project.title_en ?? "")
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
        }.onTapGesture {
            guard let urlOpen = URL(string: projectViewModel.project.link ?? "https://lucferbux.dev") else  {
                return
            }
            NSWorkspace.shared.open(urlOpen)
        }
        .padding()
        .frame(maxWidth: 700)
        .background(Color("Background 3"))
        .cornerRadius(8.0)

        
        
    }
}

struct ProjectRowViewMac_Previews: PreviewProvider {
    static var previews: some View {
        let project = projectListMock[0]
        ProjectRowViewMac(projectViewModel: ProjectViewModel(project: project))
    }
}
