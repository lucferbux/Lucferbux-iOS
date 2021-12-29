//
//  ProjectViewModel.swift
//  lucferbux ios
//
//  Created by lucas fernández on 30/9/21.
//

import Foundation
import Combine


class ProjectViewModel: ObservableObject, Identifiable, Hashable {
    
    static func == (lhs: ProjectViewModel, rhs: ProjectViewModel) -> Bool {
        return lhs._id == rhs._id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(_id)
    }
    
    private let projectRepository = ProjectsRepository()
    @Published var project: Project
    
    private var cancellables: Set<AnyCancellable> = []
    
    var _id = ""
    
    init(project: Project) {
        self.project = project
        
        $project
            .compactMap { $0._id }
            .assign(to: \._id, on: self)
            .store(in: &cancellables)
    }
}
