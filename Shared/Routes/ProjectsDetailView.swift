//
//  ProjectsView.swift
//  lucferbux ios (macOS)
//
//  Created by lucas fernández on 29/9/21.
//

import SwiftUI

struct ProjectsDetailView: View {
    var body: some View {
        ProjectListDetailContent()
            .navigationTitle("Projects")
    }
}

struct ProjectsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectsDetailView()
    }
}
