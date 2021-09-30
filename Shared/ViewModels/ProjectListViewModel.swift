//
//  ProjectListViewModel.swift
//  lucferbux ios
//
//  Created by lucas fernández on 30/9/21.
//

import Foundation
import Combine

class ProjectListviewModel: ObservableObject {
    
    @Published var projectsViewModel: [ProjectViewModel] = []
    private var cancellables: Set<AnyCancellable> = []
    
    @Published var projectRepository = ProjectsRepository()
    
    init() {
        projectRepository.$projects.map { project in
            project.map(ProjectViewModel.init)
        }
        .assign(to: \.projectsViewModel, on: self)
        .store(in: &cancellables)
    }
}
