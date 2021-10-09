//
//  ProjectsView.swift
//  lucferbux ios (iOS)
//
//  Created by lucas fernández on 29/9/21.
//

import SwiftUI

struct ProjectsView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    
    
    var body: some View {
        if horizontalSizeClass == .compact {
            ProjectViewContent()
                .background(Color("Background Body"))
                .navigationTitle("Projects")
        } else {
            ProjectViewCardContent()
                .background(Color("Background Body"))
            .navigationTitle("Projects")
        }
    }
}

struct ProjectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectsView()
    }
}
