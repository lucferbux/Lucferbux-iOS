//
//  JobsRepository.swift
//  lucferbux ios
//
//  Created by lucas fernández on 6/10/21.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

class JobsRepository:  ObservableObject {
    
    private let path: String = "team"
    private let store = Firestore.firestore()
    @Published var jobs: JobsList = []
    
    init() {
        loadJobs()
    }
    
    func loadJobs() {
        store.collection(path).order(by: "importance", descending: true).addSnapshotListener { (querySnapshot, error) in
            
            if let error = error {
                print("Error getting projects: \(error.localizedDescription)")
                return
              }
                        
            let jobs = querySnapshot?.documents.compactMap { document in
                try? document.data(as: Job.self)
            } ?? []
                        
            DispatchQueue.main.async {
                self.jobs = jobs
            }
        }
    }
}
