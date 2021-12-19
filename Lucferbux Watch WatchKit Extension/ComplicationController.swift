//
//  ComplicationController.swift
//  Lucferbux Watch WatchKit Extension
//
//  Created by lucas fernández on 25/9/21.
//

import ClockKit
import SwiftUI


class ComplicationController: NSObject, CLKComplicationDataSource {
    
    // MARK: - Complication Configuration
    let dataController = NewsData(news: newsList)

    func getComplicationDescriptors(handler: @escaping ([CLKComplicationDescriptor]) -> Void) {
      let descriptors = [
        CLKComplicationDescriptor(
          identifier: "complication",
          displayName: "Lucferbux",
          supportedFamilies: [CLKComplicationFamily.circularSmall, CLKComplicationFamily.graphicCircular, CLKComplicationFamily.graphicCorner, CLKComplicationFamily.modularSmall, CLKComplicationFamily.modularLarge, CLKComplicationFamily.graphicRectangular, CLKComplicationFamily.graphicExtraLarge])
        // Multiple complications per app support can be added here with more descriptors
      ]
      handler(descriptors)
    }

    
    func handleSharedComplicationDescriptors(_ complicationDescriptors: [CLKComplicationDescriptor]) {
        // Do any necessary work to support these newly shared complication descriptors
    }

    // MARK: - Timeline Configuration
    
    func getTimelineEndDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        // Call the handler with the last entry date you can currently provide or nil if you can't support future timelines
        handler(nil)
    }
    
    func getPrivacyBehavior(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationPrivacyBehavior) -> Void) {
        // Call the handler with your desired behavior when the device is locked
        handler(.showOnLockScreen)
    }

    // MARK: - Timeline Population
    
    func getCurrentTimelineEntry(
      for complication: CLKComplication,
      withHandler handler: @escaping (CLKComplicationTimelineEntry?) -> Void
    ) {
    
      if let next = dataController.nextNews(from: Date()),
        let ctemplate = makeTemplate(for: next, complication: complication) {
        let entry = CLKComplicationTimelineEntry(
            date: Date(),
          complicationTemplate: ctemplate)
        handler(entry)
      } else {
        handler(nil)
      }
    }

    func getTimelineEntries(
      for complication: CLKComplication,
      after date: Date,
      limit: Int,
      withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void
    ) {
      let timeline = dataController.news(after: date)
      guard !timeline.isEmpty else {
        handler(nil)
        return
      }

      let fiveMinutes = 5.0 * 60.0
      var entries: [CLKComplicationTimelineEntry] = []
      var current = date
      let endDate = date.addingTimeInterval(3600.0)

      while (current.compare(endDate) == .orderedAscending) && (entries.count < limit) {
        if let next = dataController.nextNews(from: current),
          let ctemplate = makeTemplate(for: next, complication: complication) {
          let entry = CLKComplicationTimelineEntry(
            date: current,
            complicationTemplate: ctemplate)
          entries.append(entry)
        }
        current = current.addingTimeInterval(fiveMinutes)
      }
      handler(entries)
    }

    // MARK: - Sample Templates
    
    func getLocalizableSampleTemplate(
      for complication: CLKComplication,
      withHandler handler: @escaping (CLKComplicationTemplate?) -> Void
    ) {
      handler(nil)
    }
    
}

// MARK: - Extensions

extension ComplicationController {
  func makeTemplate(
    for news: News,
    complication: CLKComplication
  ) -> CLKComplicationTemplate? {
    switch complication.family {
    case .graphicCircular:
      return CLKComplicationTemplateGraphicCircularView(
        ComplicationViewCircular())
    case .graphicCorner:
      return CLKComplicationTemplateGraphicCornerCircularView(
        ComplicationViewCornerCircular())
    case .modularLarge:
        return CLKComplicationTemplateGraphicRectangularFullView(
            ComplicationViewRectangular(news: news)
        )
    case .modularSmall:
        return CLKComplicationTemplateGraphicRectangularFullView(
            ComplicationViewRectangular(news: news)
        )
    case .graphicRectangular:
        return CLKComplicationTemplateGraphicRectangularFullView(
            ComplicationViewRectangular(news: news)
        )
    case .utilitarianLarge:
        return makeUtilitarianLargeFlat(news: news)
    case .graphicExtraLarge:
      guard #available(watchOSApplicationExtension 7.0, *) else {
        return nil
      }
      return CLKComplicationTemplateGraphicExtraLargeCircularView(
        ComplicationViewExtraLargeCircular(news: news))
    default:
      return nil
    }
  }
}

extension ComplicationController {
  func makeUtilitarianLargeFlat(news: News) -> CLKComplicationTemplateUtilitarianLargeFlat {
      let textProvider = CLKTextProvider(format: "\(String(describing: news.title))")
    if let bgimage = UIImage.swatchBackground(),
       let fgimage = UIImage.swatchForeground(name: news.title ?? ""),
       let onepiece = UIImage.swatchOnePiece(name: news.title ?? "") {
      let imageProvider = CLKImageProvider(
        onePieceImage: onepiece,
        twoPieceImageBackground: bgimage,
        twoPieceImageForeground: fgimage)
      let complication = CLKComplicationTemplateUtilitarianLargeFlat(
        textProvider: textProvider,
        imageProvider: imageProvider)
      return complication
    } else {
      let complication = CLKComplicationTemplateUtilitarianLargeFlat(
        textProvider: textProvider)
      return complication
    }
  }
}
