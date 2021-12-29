//
//  AboutMeView.swift
//  lucferbux ios (macOS)
//
//  Created by lucas fernández on 29/9/21.
//

import SwiftUI

struct AboutMeDetailView: View {
    var body: some View {
        AboutMeListDetailContent()
            .navigationTitle("About Authors")
    }
}

struct AboutMeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AboutMeDetailView()
    }
}
