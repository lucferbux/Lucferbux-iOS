//
//  ComplicationViews.swift
//  Lucferbux Watch WatchKit Extension
//
//  Created by Lucas Fernández Aragón on 13/12/21.
//

import SwiftUI
import ClockKit

struct ComplicationViews: View {
    @Environment(\.complicationRenderingMode) var renderingMode
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color("Background Watch"))
            Image("LogoNoBackground").foregroundColor(.blue)
            
        }
    }
}

struct ComplicationViewCircular: View {
    @Environment(\.complicationRenderingMode) var renderingMode
    
    var body: some View {
        ZStack {
            switch(renderingMode) {
            case .fullColor:
                Circle()
                    .fill(Color("Background Watch"))
            case .tinted:
                Circle()
                    .fill(.black)
            @unknown default:
                Circle()
                    .fill(Color("Background Watch"))
            }
            
            Image("LogoNoBackground")
                .resizable().foregroundColor(Color("Primary")).complicationForeground()
            
        }
    }
}

struct ComplicationViewCornerCircular: View {
    @Environment(\.complicationRenderingMode) var renderingMode
    
    var body: some View {
        ZStack {
            switch(renderingMode) {
            case .fullColor:
                Circle()
                    .fill(Color("Background Watch"))
            case .tinted:
                Circle()
                    .fill(Color.black)
            @unknown default:
                Circle()
                    .fill(.black)
            }
            Image("LogoNoBackground")
                .resizable()
                .foregroundColor(Color("Primary"))
                .complicationForeground()
            
        }
    }
}

struct ComplicationViewRectangular: View {
    @State var news: News
    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                Text(news.title ?? "")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .minimumScaleFactor(0.4)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                Text(news.getDate())
                    .font(.footnote)
                    .foregroundColor(Color("Primary"))
                    .complicationForeground()
            }
            Spacer()
        }
    }
}

struct ComplicationViewExtraLargeCircular: View {
    @State var news: News
    var body: some View {
        ZStack{
            AsyncImageCustom(
                url: URL(string: news.image)!,
                placeholder: { Image("LoadingPlaceholder").resizable() },
                image: {
                    Image(uiImage: $0).resizable()
                }
            )
                .clipped()
                .aspectRatio(contentMode: .fill)
                .frame(width: 170, height: 170)
                .padding(.top, 2)
            Text(news.title ?? "")
                .font(.largeTitle)
                .fontWeight(.bold)
                .minimumScaleFactor(0.4)
                .lineLimit(4)
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .padding(30)
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct ComplicationViews_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CLKComplicationTemplateGraphicCircularView(
                ComplicationViewCircular()
            ).previewContext()
            CLKComplicationTemplateGraphicCircularView(
                ComplicationViewCircular()
            ).previewContext(faceColor: .green)
            CLKComplicationTemplateGraphicCornerCircularView(
                ComplicationViewCornerCircular()
            ).previewContext(faceColor: .blue)
            CLKComplicationTemplateGraphicCornerCircularView(
                ComplicationViewCornerCircular()
            ).previewContext()
            CLKComplicationTemplateGraphicRectangularFullView(
                ComplicationViewRectangular(news: newsList[3])
            ).previewContext()
            CLKComplicationTemplateGraphicRectangularFullView(
                ComplicationViewRectangular(news: newsList[1])
            ).previewContext(faceColor: .orange)
            CLKComplicationTemplateGraphicRectangularFullView(
                ComplicationViewRectangular(news: newsList[2])
            ).previewContext()

            CLKComplicationTemplateGraphicExtraLargeCircularView(
                ComplicationViewExtraLargeCircular(
                    news: newsList[5])
            ).previewContext(faceColor: .blue)
        }
        
    }
    
}

