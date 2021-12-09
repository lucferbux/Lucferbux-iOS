//
//  AboutMeContent.swift
//  lucferbux ios (macOS)
//
//  Created by lucas fernández on 9/10/21.
//

import SwiftUI

struct AboutMeContent: View {
    var buttons: LinkButtonList = [
    LinkButton(name: "Github", link: "https://github.com/lucferbux"),
    LinkButton(name: "Linkedin", link: "https://www.linkedin.com/in/lucferbux/"),
    LinkButton(name: "Twitter", link: "https://www.twitter.com/lucferbux")]
    @ObservedObject var jobListViewModel = JobListViewModel()
    
    var body: some View {
        ScrollView {
            HStack {
                Spacer()
                VStack(alignment: .center, spacing: 20) {
                    Image("Avatar")
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .frame(width: 130 ,height: 130)
                    VStack(alignment: .center, spacing: 10){
                        Text("Lucas Fernández")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                        Text("DEVELOPER")
                            .font(.title3)
                            .fontWeight(.medium)
                            .multilineTextAlignment(.center)
                        Text("I love to learn & discover new technologies everyday.")
                            .font(.body)
                            .multilineTextAlignment(.center)
                        
                            
                    }
                    
                    HStack(alignment: .center, spacing: 20) {
                        ForEach(buttons, id: \.self.name) { button in
                            CompactButton(link: button)
                                
                            
                        }
                    }.frame(maxWidth: 200)
                    
                    
                    ForEach(jobListViewModel.jobViewModel) { jobViewModel in
                        JobViewRow(jobViewModel: jobViewModel)
                    }.padding(.horizontal)
                        .padding(.top)
                    
                }.frame(maxWidth: 600)
                #if os(macOS)
                .padding(.vertical)
                #endif
                Spacer()
            }
            
        }
        
    }
}

struct AboutMeContent_Previews: PreviewProvider {
    static var previews: some View {
        AboutMeContent()
    }
}
