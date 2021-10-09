//
//  Jobs.swift
//  lucferbux ios
//
//  Created by lucas fernández on 6/10/21.
//

import Foundation
import FirebaseFirestore // (1)
import FirebaseFirestoreSwift

typealias JobsList = [Job]

struct Job: Codable, Identifiable {
    @DocumentID var _id: String?
    var id: String?
    var name: String?
    var name_en: String?
    var importance: String?
    var avatar: String
    var description: String?
    var description_en: String?
    var job: String?
    var job_en: String?
    var icon: String?
}



let jobsListMock: JobsList = [
    Job(_id: "1c3sYHXNIo1sHCzp0tlh",
        id: "1c3sYHXNIo1sHCzp0tlh",
         name: "Master Desarrollo Full Stack",
         name_en: "Postgraduate Full Stack Development",
         importance: "2",
         avatar: "https://firebasestorage.googleapis.com/v0/b/lucferbux-web-page.appspot.com/o/avatar%2F1610067339828_job_avatar?alt=media&token=763a2df0-92c7-4672-8a0f-eb6c36d5c81c",
         description: "Director del Máster Full Stack de Threepoints donde coordino e imparto  asignaturas orientadas al desarrollo web.",
         description_en: "Director of the Postgraduate in Full Stack Development in which I coordinate and teach a few subjects.",
         job: "2021 -",
         job_en: "2021 -",
         icon: "threepoints"),
]

