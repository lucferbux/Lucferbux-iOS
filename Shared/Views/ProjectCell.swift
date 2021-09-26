//
//  ProjectCell.swift
//  lucferbux ios
//
//  Created by lucas fernández on 20/9/21.
//

import SwiftUI

struct ProjectCell: View {
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: "paperplane.circle.fill")
                .renderingMode(.original)
                .imageScale(.medium)
            VStack(alignment: .leading, spacing: 4) {
                Text("SwiftUI")
                        .font(.subheadline)
                        .fontWeight(.bold)
                Text("Description")
                        .font(.footnote)
                        .foregroundColor(Color.secondary)
            }
        }
    }
}

struct ProjectCell_Previews: PreviewProvider {
    static var previews: some View {
        ProjectCell()
    }
}
