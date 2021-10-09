//
//  ProjectCardView.swift
//  lucferbux ios
//
//  Created by lucas fernández on 1/10/21.
//

import SwiftUI

struct ProjectCardView: View {
    var projectViewModel: ProjectViewModel
    
    var body: some View {
        Link(destination: URL(string: projectViewModel.project.link ?? "https://lucferbux.dev")!) {
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
                    .lineLimit(3)
            }
            .padding()
        }.buttonStyle(PlainButtonStyle())
            .background(Color("Background Cell"))
            .cornerRadius(20.0)
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            
          
    }
}

struct ProjectCardView_Previews: PreviewProvider {
    static var previews: some View {
        let project = projectListMock[0]
        ProjectCardView(projectViewModel: ProjectViewModel(project: project))
    }
}
