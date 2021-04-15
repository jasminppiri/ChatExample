//
//  Date.swift
//  ChatExample
//
//  Created by Jasmin Patel on 16/04/21.
//

import Foundation

enum DisplayTime {
    case short
    case long

    var seconds: String {
        switch self {
        case .short: return "s"
        case .long: return "seconds"
        }
    }

    var minutes: String {
        switch self {
        case .short: return "m"
        case .long: return "minutes"
        }
    }

    var hours: String {
        switch self {
        case .short: return "h"
        case .long: return "hours"
        }
    }

    var days: String {
        switch self {
        case .short: return "d"
        case .long: return "days"
        }
    }

    var weeks: String {
        switch self {
        case .short: return "w"
        case .long: return "weeks"
        }
    }
}

extension Date {
    
    func timeAgoDisplay(_ display: DisplayTime) -> String {
        
        let secondsAgo = Int(Date().timeIntervalSince(self))
        
        let minute = 60
        let hour = 60 * minute
        let day = 24 * hour
        let week = 7 * day
        
        switch secondsAgo {
        case let seconds where seconds < minute : return "Just Now"
        case let seconds where seconds < hour: return "\(secondsAgo / minute) \(display.minutes)"
        case let seconds where seconds < day: return "\(secondsAgo / hour) \(display.hours)"
        case let seconds where seconds < week: return "\(secondsAgo / day) \(display.days)"
        default: return "\(secondsAgo / week) \(display.weeks)"
        }
    }
    
}
