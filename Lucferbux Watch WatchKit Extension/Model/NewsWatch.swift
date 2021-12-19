//
//  NewsWatch.swift
//  Lucferbux Watch WatchKit Extension
//
//  Created by Lucas Fernández Aragón on 10/12/21.
//

import Foundation

typealias NewsList = [News]

struct News: Codable, Identifiable {
    var id: String?
    var title: String?
    var image: String
    var description: String?
    var timestamp: Double?
    var url: String?
    
    func getDate() -> String {
        let dateFormatter = DateFormatter()
        let date = Date(timeIntervalSince1970: timestamp ?? 1639154893)
        dateFormatter.dateStyle = .medium
        let dateFormated = dateFormatter.string(from: date)
        return dateFormated
    }
}



let newsList: NewsList = [
    News(id: "qpIdPHq0do7Yp9F1IE5H",
         title: "Lucferbux Android App",
         image: "https://firebasestorage.googleapis.com/v0/b/lucferbux-web-page.appspot.com/o/introImage%2F1624647212278_intro_image?alt=media&token=52dbb57a-841f-4d68-aaa3-ef8e7737de91",
         description: "After many reviews, I think I can deploy another of my side-projects in which I've been working on for the last couple of weeks. This is an Android port of my personal webpage. The style mimics the new Material You and the core components are based on the modern Android Architecture pattern with MVVM, Room, Retrofit, Kotlin...\nI'm planning to add new features such as new Widgets, dynamic colors, ARCore, and other cool Android frameworks in order to expand my knowledge of this platform.",
         timestamp: 1624645875,
         url: "https://play.google.com/store/apps/details?id=com.lucferbux.lucferbux"
        ),
    News(id: "vfv5cSr4qHyXh2gBYV0i",
         title: "Master's Degree in Full Stack Development",
         image: "https://firebasestorage.googleapis.com/v0/b/lucferbux-web-page.appspot.com/o/introImage%2F1612627099440_intro_image?alt=media&token=803597c7-e551-4b52-9859-e01535ca7982",
         description: "There is no much time left to start the Master's Degree in Full Stack Development of Three Points with Collaboration of the UPC.\nThe main goal of this Master is to provide a general vision of the Full Stack Development to a manager o director profile.\nThat is why, on top of the technical concepts, the students will learn to analyze all the software development stages, in order to face all the technical difficulties that might appear with a low level understanding of the situation.\nAll the professors are top professionals in their respective careers and they gather both technical and managing experience in order to deliver the best possible content.\nI am very thrilled for the beginning of the new course and I hope all the students will be satisfied with the result.",
         timestamp: 1612626975,
         url: "https://www.threepoints.com/es/master-en-full-stack-web-development"
        ),
    News(id: "rIUzPQDEqDQYg0aPtEHp",
         title: "Lucferbux V2",
         image: "https://firebasestorage.googleapis.com/v0/b/lucferbux-web-page.appspot.com/o/introImage%2F1612527796622_intro_image?alt=media&token=9e422eae-5409-4fb3-a369-d4f836c3c71a",
         description: "I've redesigned my webpage. It's a migration from Angular to React in the front, using Gatsby with SSR in order to improve the speed and responsiveness of the web. \nIn this version I've focused my attention in the visual part, this web has now more interactive elements, animations and better graphics.\nIt's still a Work In Progress but I hope you will like it.\nBye! 👋",
         timestamp: 1612527414,
         url: "https://lucferbux.dev"
        ),
    News(id: "UN37bqSLZyAWz38R93q0",
         title: "HackOn",
         image: "https://firebasestorage.googleapis.com/v0/b/lucferbux-web-page.appspot.com/o/introImage%2F1582038088019_intro_image?alt=media&token=2bd767f0-1904-461c-a66d-69b0ba7c59b7",
         description: "The video of the workshop about Digital Identity, OSINT and Metadata I delivered at University Rey Juan Carlos has already been published. In this workshop I talked about different techniques that can be performed with public information about a target, and I did some PoCs with four tools developed in Telefonica with the goal of raise awareness about the misuse of information.\nThese four tools are Dirty Business Card, targeted to OSINT and Digital Identity, FOCA, that manages all the Metadata of a given domain, Air Profiling to profile the navigation of a phone and Airdrop Crazy to scan the environment to find Apple devices.\nWe had fun talking about all the modern threats that we could face on the Internet and how we could avoid some attacks. Have fun ;)",
         timestamp: 1582038083,
         url: "https://tv.urjc.es/video/5e415ea8d68b1430398b8bc1"
        ),
    News(id: "ba5ipRvZXe4kRXnKWkKj",
         title: "h-c0n",
         image: "https://firebasestorage.googleapis.com/v0/b/lucferbux-web-page.appspot.com/o/introImage%2F1582037395124_intro_image?alt=media&token=27b7d739-80e0-4616-9c22-47258084e2c2",
         description: "A few weeks ago, I was invited to h-c0n the Hackplayers' conference. Despite some problems with some PoCs, we have a really great time, I talked about one of the researches we've been working lately about all the risks around BLE & Airdrop in Apple devices.\nThis research is not new, I posted here the Codetalk for Developers' video in which we dove into all the features, implementations and PoCs of this tool, such as the positibility to intercept phone numbers, OSINT capabilities to extract more info of the victim and the BLE scan of the surroundings.\nHere you have the slides (clicking in to the card) if you want to check the main points of the talk and get all the resources and PoCs I used.",
         timestamp: 1582037121,
         url: "https://www.slideshare.net/LucasFernndezAragn/airdrop-ble-y-wifi-sharing-presentacin-hc0n"
        ),
    News(id: "I1raum5s943jFPL3SWNA",
         title: "Don't Push That Button: General Vision",
         image: "https://firebasestorage.googleapis.com/v0/b/lucferbux-web-page.appspot.com/o/introImage%2F1573219578182_intro_image?alt=media&token=42908fec-2396-4960-a636-4c412cc04f91",
         description: "Today, after several months of preparation, I can show the first video of Don't Push That Button. Don't Push That Button is a dissemination channel (with the intention of being cross-platform) where you can post videos related to various branches of computing. All this came after reviewing my notes from my Computer Science's Degree, many of the things were very useful but I had not assimilated them well due to the rush and lack of overview. So my goal is that after watching each video, a person ends up knowing a little more about a technological topic and who knows how to relate it to other concepts.",
         timestamp: 1573219559,
         url: "https://youtu.be/E9OIXlRGlp0"
        ),
    News(id: "68gNf1DpcH2tQA23dOP2",
         title: "Airdrop Crazy: What happens on your iPhone, stays on your iPhone",
         image: "https://firebasestorage.googleapis.com/v0/b/lucferbux-web-page.appspot.com/o/introImage%2F1573219093609_intro_image?alt=media&token=27a0dbab-c349-4e7a-9933-522d66c033db",
         description: "Airdrop Crazy, the first of the 12 tools that the Crazy Ideas team wants to present in the next 12 months, is now released.\nThis tool is based on the research conducted by the Hexway team in which they discussed a way to identify the status of devices through BLE ad packages. In addition, they also managed to see that in Airdrop the devices are enunciating the hash of the personal number to distinguish between friends and strangers.\nBased on this we have created a service and an app and we have taken the investigation to a new level, I hope you like it.",
         timestamp: 1573218976,
         url: "https://www.elladodelmal.com/2019/10/airdrop-crazy-lo-que-pasa-en-tu-iphone.html"
        ),
    News(id: "qTF9N9ZmXCboRmb75SVs",
         title: "PoC: Phishing with Google Assistant",
         image: "https://firebasestorage.googleapis.com/v0/b/lucferbux-web-page.appspot.com/o/introImage%2F1572421440859_intro_image?alt=media&token=1f0ae729-208e-4869-8635-46272f4fee2d",
         description: "Check out the post that I've written in \"Elladodelmal\" that I made based on the research made by Security Researcher Labs team. This demo, in addition to being very attractive, is really easy to get, in just 20 minutes and without the need for writting code it is possible to mount a similar scenario. For more details I leave the link of the article where everything is explained in depth.",
         timestamp: 1572421398,
         url: "https://www.elladodelmal.com/2019/10/un-phishing-con-cognitive-services.html"
        ),
    News(id: "89asdfasdf9809sdf",
         title: "Dark Mode in Safepost",
         image: "https://firebasestorage.googleapis.com/v0/b/lucferbux-web-page.appspot.com/o/introImage%2F1570690185932_intro_image?alt=media&token=d8b1e10b-4fa5-4564-b88e-f8fc8fcc761a",
         description: "Yesterday we finally managed to launch the Safepost update for iOS 13. Among its main innovations, it lives up to its counterpart in iOS with the dark mode that is so fashionable today and brings a series of improvements adapted for iOS 13 and the resolution of certain bugs.",
         timestamp: 1570690145,
         url: "https://apps.apple.com/es/app/safepost/id1431862886"
        ),
    News(id: "aGCo7X0vaHjkVaryONpf",
         title: "Photoplethysmography",
         image: "https://firebasestorage.googleapis.com/v0/b/lucferbux-web-page.appspot.com/o/introImage%2F1562576031968_intro_image?alt=media&token=43248e29-e834-469d-972c-e4d28b1d5abc",
         description: "Some time ago we recorded a video with the intention of creating a new broadcast series within Telefonica focused on the research we carried out at Ideas Locas, and it seems to have been well received.\nIn this first video we talk about a health-oriented technology, photoplethysmography.\nThis technique allows heart rate to be measured accurately and with cheap hardware, which is why it is currently used in a wide variety of devices.\nContinuing with the article, we also mention the ability to represent the electrical activity of the heart thanks to the new one-point electrocardiograms incorporated in smart watches.",
         timestamp: 1562575696,
         url: "https://blogthinkbig.com/fotopletismografia-telefonica"
        ),
]

