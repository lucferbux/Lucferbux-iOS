//
//  ProjectsView.swift
//  lucferbux ios (iOS)
//
//  Created by lucas fernández on 29/9/21.
//

import SwiftUI

struct ProjectsView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
//        if horizontalSizeClass == .compact {
//            ProjectViewContent()
//                .navigationTitle("Projects")
//        } else {
//            ProjectViewCardContent()
//            .navigationTitle("Projects")
//        }
        
        
        ProjectViewContent()
            .navigationTitle("Projects")
        
        
    }
}

struct ProjectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectsView()
    }
}
