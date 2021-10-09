//
//  Post.swift
//  lucferbux ios
//
//  Created by lucas fernández on 6/10/21.
//

import Foundation
import FirebaseFirestore // (1)
import FirebaseFirestoreSwift

typealias PostList = [Post]

struct Post: Codable, Identifiable {
    @DocumentID var _id: String?
    var id: String?
    var title: String?
    var title_en: String?
    var image: String
    var description: String?
    var description_en: String?
    @ServerTimestamp var date: Timestamp?
    var link: String?
    var loaded: Bool?
    
    func getDate() -> String {
        let dateFormatter = DateFormatter()
        let date = date?.dateValue() ?? Date()
        dateFormatter.dateStyle = .medium
        let dateFormated = dateFormatter.string(from: date)
        return dateFormated
    }
}



let postListMock: PostList = [
    Post(_id: "1c3sYHXNIo1sHCzp0tlh",
        id: "1c3sYHXNIo1sHCzp0tlh",
         title: "How apps can track you even after uninstalling them",
         title_en: "How apps can track you even after uninstalling them",
         image: "https://firebasestorage.googleapis.com/v0/b/lucferbux-web-page.appspot.com/o/postImage%2F1590408977827_post_image?alt=media&token=32f7f9e5-6357-4137-9ae5-803b644b518b",
         description: "Aquí hablamos de algunas de las técnicas que siguen librerías para determinar si un usuario desinstalado sus aplicaciones. Una de ellas es lanzar “pings” mediante push notifications esperando respuesta.",
         description_en: "Here we talk about some of the techniques that libraries follow to determine if a user uninstalled their applications. One of them is to launch “pings” through push notifications waiting for a response.",
         date: Timestamp.init(),
         link: "https://www.seguridadapple.com/2018/10/como-apps-pueden-rastrearte-incluso.html",
         loaded: false),
    

]

