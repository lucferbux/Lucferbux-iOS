//
//  Project.swift
//  lucferbux ios
//
//  Created by lucas fernández on 30/9/21.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

typealias ProjectList = [Project]

struct Project: Codable, Identifiable {
    @DocumentID var _id: String?
    var id: String?
    var title: String?
    var title_en: String?
    var version: String?
    var tags: String?
    var description: String?
    var description_en: String?
    var featured: Bool?
    @ServerTimestamp var date: Timestamp?
    var link: String?
    
    func getDate() -> String {
        let dateFormatter = DateFormatter()
        let date = date?.dateValue() ?? Date()
        dateFormatter.dateStyle = .medium
        let dateFormated = dateFormatter.string(from: date)
        return dateFormated
    }
}


#if DEBUG
let projectListMock: ProjectList = [
    Project(_id: "1c3sYHXNIo1sHCzp0tlh",
        id: "1c3sYHXNIo1sHCzp0tlh",
         title: "Lucferbux Angular Web",
         title_en: "Lucferbux Angular Web",
         version: "1.0.1",
         tags:"Angular, Firebase..",
         description: "Antigua página web creada en Angular utilizando diferentes patrones y buenas prácticas del framework. Tiene login, i18n, modo oscuro...",
         description_en: "Old webpage created in Angular, using different patterns and best practices related to the Framework as i18n, dark mode, accesibility...",
         featured: false,
         date: Timestamp.init(),
         link: "https://github.com/lucferbux/WebPageLucferbux"
         )
]
#endif
