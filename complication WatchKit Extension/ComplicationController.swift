//
//  ComplicationController.swift
//  complication WatchKit Extension
//
//  Created by Stuart Varrall on 11/06/2015.
//  Copyright © 2015 Stuart Varrall. All rights reserved.
//

import ClockKit


class ComplicationController: NSObject, CLKComplicationDataSource {
    
    // MARK: - Timeline Configuration
    
    func getSupportedTimeTravelDirectionsForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationTimeTravelDirections) -> Void) {
        handler([.Forward, .Backward])
    }
    
    func getTimelineStartDateForComplication(complication: CLKComplication, withHandler handler: (NSDate?) -> Void) {
        handler(nil)
    }
    
    func getTimelineEndDateForComplication(complication: CLKComplication, withHandler handler: (NSDate?) -> Void) {
        handler(nil)
    }
    
    func getPrivacyBehaviorForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationPrivacyBehavior) -> Void) {
        handler(.ShowOnLockScreen)
    }
    
    // MARK: - Timeline Population
    
    func getCurrentTimelineEntryForComplication(complication: CLKComplication, withHandler handler: ((CLKComplicationTimelineEntry?) -> Void)) {
        
        var returnTemplate: CLKComplicationTemplate? = nil
        
        switch complication.family {
        case .ModularSmall:
            let template = CLKComplicationTemplateModularSmallSimpleText()
            template.textProvider = CLKSimpleTextProvider(text: "Template", shortText: "temp", accessibilityLabel: "Template Text")
            returnTemplate = template
        case .ModularLarge:
            let template = CLKComplicationTemplateModularLargeStandardBody()
            template.headerTextProvider = CLKSimpleTextProvider(text: "Header", shortText: "Head", accessibilityLabel: "Template Text")
            template.body1TextProvider = CLKSimpleTextProvider(text: "Body1", shortText: "B!", accessibilityLabel: "Template Text")
            template.body2TextProvider = CLKSimpleTextProvider(text: "Body2", shortText: "B2", accessibilityLabel: "Template Text")
            if let image = UIImage(named: "Complication/Modular") {
                template.headerImageProvider = CLKImageProvider(backgroundImage: image, backgroundColor: nil)
            }
            returnTemplate = template
        case .UtilitarianSmall:
            let template = CLKComplicationTemplateUtilitarianSmallFlat()
            template.textProvider = CLKSimpleTextProvider(text: "Template", shortText: "TEMP", accessibilityLabel: "Template Text")
            if let image = UIImage(named: "Complication/Utilitarian") {
                template.imageProvider = CLKImageProvider(backgroundImage: image, backgroundColor: nil)
            }
            returnTemplate = template
        case .UtilitarianLarge:
            let template = CLKComplicationTemplateUtilitarianLargeFlat()
            template.textProvider = CLKSimpleTextProvider(text: "Template", shortText: "TEMP", accessibilityLabel: "Template Text")
            if let image = UIImage(named: "Complication/Utilitarian") {
                template.imageProvider = CLKImageProvider(backgroundImage: image, backgroundColor: nil)
            }
            returnTemplate = template
        case .CircularSmall:
            let template = CLKComplicationTemplateCircularSmallRingText()
            template.textProvider = CLKSimpleTextProvider(text: "20")
            template.fillFraction = 0.7
            template.ringStyle = CLKComplicationRingStyle.Closed
            returnTemplate = template
        }
        
        let timelineEntry = CLKComplicationTimelineEntry(date: NSDate(), complicationTemplate: returnTemplate!)
        handler(timelineEntry)
    }
    
    func getTimelineEntriesForComplication(complication: CLKComplication, beforeDate date: NSDate, limit: Int, withHandler handler: (([CLKComplicationTimelineEntry]?) -> Void)) {
        // Call the handler with the timeline entries prior to the given date
        handler(nil)
    }
    
    func getTimelineEntriesForComplication(complication: CLKComplication, afterDate date: NSDate, limit: Int, withHandler handler: (([CLKComplicationTimelineEntry]?) -> Void)) {
        // Call the handler with the timeline entries after to the given date
        handler(nil)
    }
    
    // MARK: - Update Scheduling
    
    func getNextRequestedUpdateDateWithHandler(handler: (NSDate?) -> Void) {
        // Call the handler with the date when you would next like to be given the opportunity to update your complication content
        handler(NSDate(timeIntervalSinceNow: 60))
    }
    
    // MARK: - Placeholder Templates
    
    func getPlaceholderTemplateForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationTemplate?) -> Void) {
        var returnTemplate: CLKComplicationTemplate? = nil
        switch complication.family {
        case .ModularSmall:
            let template = CLKComplicationTemplateModularSmallSimpleText()
            template.textProvider = CLKSimpleTextProvider(text: "ModSmall", shortText: "temp", accessibilityLabel: "Template Text")
            returnTemplate = template
        case .ModularLarge:
            let template = CLKComplicationTemplateModularLargeStandardBody()
            template.headerTextProvider = CLKSimpleTextProvider(text: "Header", shortText: "Head", accessibilityLabel: "Template Text")
            template.body1TextProvider = CLKSimpleTextProvider(text: "Body1", shortText: "B1", accessibilityLabel: "Template Text")
            template.body2TextProvider = CLKSimpleTextProvider(text: "Body2", shortText: "B2", accessibilityLabel: "Template Text")
            if let image = UIImage(named: "Complication/Modular") {
                template.headerImageProvider = CLKImageProvider(backgroundImage: image, backgroundColor: nil)
            }
            returnTemplate = template
        case .UtilitarianSmall:
            let template = CLKComplicationTemplateUtilitarianSmallFlat()
            template.textProvider = CLKSimpleTextProvider(text: "UtilSmall", shortText: "UtilSmall", accessibilityLabel: "Template Text")
            if let image = UIImage(named: "Complication/Utilitarian") {
                template.imageProvider = CLKImageProvider(backgroundImage: image, backgroundColor: nil)
            }
            returnTemplate = template
        case .UtilitarianLarge:
            let template = CLKComplicationTemplateUtilitarianLargeFlat()
            template.textProvider = CLKSimpleTextProvider(text: "UtilLargeFlat", shortText: "TEMP", accessibilityLabel: "Template Text")
            if let image = UIImage(named: "Complication/Utilitarian") {
                template.imageProvider = CLKImageProvider(backgroundImage: image, backgroundColor: nil)
            }
            returnTemplate = template
        case .CircularSmall:
            let template = CLKComplicationTemplateCircularSmallRingText()
            template.textProvider = CLKSimpleTextProvider(text: "--")
            template.fillFraction = 0.4
            template.ringStyle = CLKComplicationRingStyle.Closed
            returnTemplate = template
        }
        
        handler(returnTemplate)
    }
    
}
