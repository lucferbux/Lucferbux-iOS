//
//  JobViewRow.swift
//  lucferbux ios
//
//  Created by lucas fernández on 6/10/21.
//

import SwiftUI

struct JobViewRow: View {
    var jobViewModel: JobViewModel
    
    
    var body: some View {
        HStack(alignment: .top, spacing: 10.0) {
            AsyncImageCustom(
                url: URL(string: jobViewModel.job.avatar)!,
                placeholder: { Image("LoadingPlaceholder").resizable() },
                image: {
                    #if os(iOS)
                    Image(uiImage: $0).resizable()
                    #else
                    Image(nsImage: $0).resizable()
                    #endif
                }
            )
             .clipped()
             .frame(width: 50, height: 50)
             .cornerRadius(25)
             .padding(.top, 2)
            
            VStack(alignment: .leading, spacing: 4.0) {
                Text(jobViewModel.job.name_en ?? "")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text(jobViewModel.job.job_en ?? "")
                    .font(.footnote)
                    .fontWeight(.light)
                Text(jobViewModel.job.description_en ?? "")
                    .font(.body)
            }
        }
        .padding(.vertical, 4)
        .frame(maxWidth: 600, alignment: .leading)
    }
}

struct JobViewRow_Previews: PreviewProvider {
    static var previews: some View {
        let jobViewModel = JobViewModel(job: jobsListMock[0])
        JobViewRow(jobViewModel: jobViewModel)
    }
}
