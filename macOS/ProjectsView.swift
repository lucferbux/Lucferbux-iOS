//
//  ProjectsView.swift
//  lucferbux ios (macOS)
//
//  Created by lucas fernández on 29/9/21.
//

import SwiftUI

struct ProjectsView: View {
    var body: some View {
        ProjectViewMacContent()
            .navigationTitle("Projects")
    }
}

struct ProjectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectsView()
    }
}
