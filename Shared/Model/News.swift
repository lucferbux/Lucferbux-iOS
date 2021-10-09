//
//  News.swift
//  LucferbuxIos
//
//  Created by lucas fernández on 15/04/2020.
//  Copyright © 2020 lucas fernández. All rights reserved.
//

import Foundation
import FirebaseFirestore // (1)
import FirebaseFirestoreSwift

typealias NewsList = [News]

struct News: Codable, Identifiable {
    @DocumentID var _id: String?
    var id: String?
    var title: String?
    var title_en: String?
    var image: String
    var description: String?
    var description_en: String?
    @ServerTimestamp var timestamp: Timestamp?
    var url: String?
    var loaded: Bool?
    
    func getDate() -> String {
        let dateFormatter = DateFormatter()
        let date = timestamp?.dateValue() ?? Date()
        dateFormatter.dateStyle = .medium
        let dateFormated = dateFormatter.string(from: date)
        return dateFormated
    }
}



let newsListMock: NewsList = [
    News(_id: "1c3sYHXNIo1sHCzp0tlh",
        id: "1c3sYHXNIo1sHCzp0tlh",
         title: "Stack Sms",
         title_en: "Stack Sms",
         image: "https://firebasestorage.googleapis.com/v0/b/lucferbux-web-page.appspot.com/o/introImage%2F1552158957110_intro_image?alt=media&token=fcea2db6-4c38-4aa3-bb0d-5198a4fa554b",
         description: "Stack Sms es un proyecto en el que llevamos trabajando ya un tiempo en Ideas Locas. El concepto básico es dar capacidades parecidas a la pila TCP en la red Gsm a través de Sms. Además podemos encapsular otros protocolos encima de Stack Sms para que se ajuste a multiples necesidades.\nFran, un compañero de Ideas Locas ha escrito un excelente artículo explicando un poco el protocolo, como descargarlo y casos de uso útiles. Es un proyecto bastante singular y merece la pena echarle un ojo, así que os animo a leer el artículo e ir al github oficial.",
         description_en: "Stack Sms es un proyecto en el que llevamos trabajando ya un tiempo en Ideas Locas. El concepto básico es dar capacidades parecidas a la pila TCP en la red Gsm a través de Sms. Además podemos encapsular otros protocolos encima de Stack Sms para que se ajuste a multiples necesidades.\nFran, un compañero de Ideas Locas ha escrito un excelente artículo explicando un poco el protocolo, como descargarlo y casos de uso útiles. Es un proyecto bastante singular y merece la pena echarle un ojo, así que os animo a leer el artículo e ir al github oficial.",
         timestamp: Timestamp.init(),
         url: "http://www.elladodelmal.com/2019/03/antiddos-para-todos-los-dispositivos.html?m=1",
         loaded: false),
    
    
    News(_id: "68gNf1DpcH2tQA23dOP2",
        id: "68gNf1DpcH2tQA23dOP2",
    title: "Airdrop Crazy. Lo que pasa en tu iPhone NO se queda en tu iPhone",
    title_en: "Airdrop Crazy. Lo que pasa en tu iPhone NO se queda en tu iPhone",
    image: "https://firebasestorage.googleapis.com/v0/b/lucferbux-web-page.appspot.com/o/introImage%2F1573219093609_intro_image?alt=media&token=27a0dbab-c349-4e7a-9933-522d66c033db",
    description: "Ya está liberada Airdrop Crazy, la primera de las 12 herramientas que queremos presentar el equipo de Ideas Locas en los próximos 12 meses.\nEsta herramienta está basada en una investigación realizada por el equipo de Hexway en la que hablaban sobre una forma de identificar el estado de los dispositivos a través de los paquetes de anuncio de BLE. Además, también consiguieron ver que en Airdrop los dispositivos van enunciando el hash del número personal para distinguir entre conocidos y extraños.\nEn base a esto hemos creado un servicio y una app y hemos llevado la investigación a un nuevo nivel, espero que os guste.",
    description_en: "Ya está liberada Airdrop Crazy, la primera de las 12 herramientas que queremos presentar el equipo de Ideas Locas en los próximos 12 meses.\nEsta herramienta está basada en una investigación realizada por el equipo de Hexway en la que hablaban sobre una forma de identificar el estado de los dispositivos a través de los paquetes de anuncio de BLE. Además, también consiguieron ver que en Airdrop los dispositivos van enunciando el hash del número personal para distinguir entre conocidos y extraños.\nEn base a esto hemos creado un servicio y una app y hemos llevado la investigación a un nuevo nivel, espero que os guste.",
    timestamp: Timestamp.init(),
    url: "https://www.elladodelmal.com/2019/10/airdrop-crazy-lo-que-pasa-en-tu-iphone.html",
    loaded: false),
]

