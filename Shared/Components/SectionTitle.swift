//
//  SectionTitle.swift
//  lucferbux ios
//
//  Created by lucas fernández on 29/9/21.
//

import SwiftUI

struct SectionTitle: View {
    var title = ""
    var body: some View {
        HStack {
            Text(title).bold()
                .padding(.horizontal)
                .padding(.top, 16)
            Spacer()
        }
    }
}

struct SectionTitle_Previews: PreviewProvider {
    static var previews: some View {
        SectionTitle()
    }
}
