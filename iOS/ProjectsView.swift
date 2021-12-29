//
//  ProjectsView.swift
//  lucferbux ios (iOS)
//
//  Created by lucas fernández on 29/9/21.
//

import SwiftUI

struct ProjectsView: View {
    
    var body: some View {
            ProjectListContent()
                .background(Color("Background Body"))
                .navigationTitle("Projects")
    }
}

struct ProjectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectsView()
    }
}
