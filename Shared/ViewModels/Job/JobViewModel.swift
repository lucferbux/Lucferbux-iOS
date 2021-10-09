//
//  AboutMeViewModel.swift
//  lucferbux ios
//
//  Created by lucas fernández on 6/10/21.
//

import Foundation
import Combine


class JobViewModel: ObservableObject, Identifiable {
    
    private let jobRepository = JobsRepository()
    @Published var job: Job
    
    private var cancellables: Set<AnyCancellable> = []
    
    var _id = ""
    
    init(job: Job) {
        self.job = job
        
        $job
            .compactMap { $0._id }
            .assign(to: \._id, on: self)
            .store(in: &cancellables)
    }
}
