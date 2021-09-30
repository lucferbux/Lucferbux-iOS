//
//  PostsRepository.swift
//  lucferbux ios
//
//  Created by lucas fernández on 30/9/21.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

class ProjectsRepository:  ObservableObject {
    
    private let path: String = "project"
    private let store = Firestore.firestore()
    @Published var projects: ProjectList = []
    
    init() {
        loadProjects()
    }
    
    func loadProjects() {
        store.collection(path).order(by: "date", descending: true).addSnapshotListener { (querySnapshot, error) in
            
            if let error = error {
                print("Error getting projects: \(error.localizedDescription)")
                return
              }
                        
            let projects = querySnapshot?.documents.compactMap { document in
                try? document.data(as: Project.self)
            } ?? []
                        
            DispatchQueue.main.async {
                self.projects = projects
            }
        }
    }
    

}
