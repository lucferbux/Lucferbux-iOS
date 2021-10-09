//
//  AboutMeListViewModel.swift
//  lucferbux ios
//
//  Created by lucas fernández on 6/10/21.
//

import Foundation
import Combine

class JobListViewModel: ObservableObject {
    
    @Published var jobViewModel: [JobViewModel] = []
    private var cancellables: Set<AnyCancellable> = []
    
    @Published var jobRepository = JobsRepository()
    
    init() {
        jobRepository.$jobs.map { job in
            job.map(JobViewModel.init)
        }
        .assign(to: \.jobViewModel, on: self)
        .store(in: &cancellables)
    }
}
