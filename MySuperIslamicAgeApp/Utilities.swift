//
//  Utilities.swift
//  MySuperIslamicAgeApp
//
//  Created by Mohammad Hemani on 3/25/17.
//  Copyright © 2017 Mohammad Hemani. All rights reserved.
//

import Foundation

enum DateType: String {
    case Gregorian
    case Islamic
}

func getIslamicDateFromGregorianDate(_ gregorianDate: String) -> (string: String, date: Date)? {
    
    let dateFormatter = DateFormatter()
    dateFormatter.calendar = Calendar(identifier: .gregorian)
    dateFormatter.dateFormat = "M/dd/yy"
    if let gregorianDate = dateFormatter.date(from: gregorianDate) {
        
        let islamic = Calendar(identifier: .islamicUmmAlQura)
        let components = islamic.dateComponents([.month, .day, .year], from: gregorianDate)
        if let date = islamic.date(from: components) {
            
            dateFormatter.calendar = Calendar(identifier: .islamicUmmAlQura)
            dateFormatter.dateStyle = .long
            dateFormatter.timeStyle = .none
            
            let dateString = dateFormatter.string(from: date)
            return (dateString, date)
            
        } else {
            return nil
        }
        
    } else {
        return nil
    }
    
}

func getGregorianDateFromIslamicDate(_ islamicDate: String) -> (string: String, date: Date)? {
    
    let dateFormatter = DateFormatter()
    dateFormatter.calendar = Calendar(identifier: .islamicUmmAlQura)
    dateFormatter.dateFormat = "M/dd/yy"
    if let islamicDate = dateFormatter.date(from: islamicDate) {
        
        let gregorian = Calendar(identifier: .gregorian)
        let components = gregorian.dateComponents([.month, .day, .year], from: islamicDate)
        if let date = gregorian.date(from: components) {
            
            dateFormatter.calendar = Calendar(identifier: .gregorian)
            dateFormatter.dateStyle = .long
            dateFormatter.timeStyle = .none
            
            let dateString = dateFormatter.string(from: date)
            return (dateString, date)
            
        } else {
            return nil
        }
        
    } else {
        return nil
    }
    
}

func daysPassedFromGregorianDate(_ gregorianString: String) -> String {
    
    let gregorianCalendar = Calendar(identifier: .gregorian)
    
    let dateFormatter = DateFormatter()
    dateFormatter.calendar = gregorianCalendar
    dateFormatter.dateFormat = "M/dd/yy"
    if let gregorianDate = dateFormatter.date(from: gregorianString) {
        
        let components = gregorianCalendar.dateComponents([.month, .day, .year], from: gregorianDate)
        
        var todaysDate = Date()
        todaysDate = gregorianCalendar.startOfDay(for: todaysDate)
        
        if let date = gregorianCalendar.date(from: components) {
            
            let components = gregorianCalendar.dateComponents([.month, .day, .year], from: date, to: todaysDate)
            
            if let year = components.year, let month = components.month, let day = components.day {
                
                if year < 0 || day < 0 || month < 0 {
                    
                    return "\(abs(year)) years, \(abs(month)) months, \(abs(day)) days are left"
                    
                } else {
                    
                    return "\(year) years, \(month) months, \(day) days have passed"
                    
                }
                
            }
            
        }
    }
    
    return "0 years, 0 months, 0 days have passed"
    
}

func daysPassedFromIslamicDate(_ islamicString: String) -> String? {
    
    let islamicCalendar = Calendar(identifier: .islamicUmmAlQura)
    
    let dateFormatter = DateFormatter()
    dateFormatter.calendar = islamicCalendar
    dateFormatter.dateFormat = "M/dd/yy"
    if let islamicDate = dateFormatter.date(from: islamicString) {
        
        let components = islamicCalendar.dateComponents([.month, .day, .year], from: islamicDate)
        
        var todaysDate = Date()
        todaysDate = islamicCalendar.startOfDay(for: todaysDate)
        
        if let date = islamicCalendar.date(from: components) {
            
            let components = islamicCalendar.dateComponents([.month, .day, .year], from: date, to: todaysDate)
            
            if let year = components.year, let month = components.month, let day = components.day {
                
                if year < 0 || day < 0 || month < 0 {
                    
                    return "\(abs(year)) years, \(abs(month)) months, \(abs(day)) days are left"
                    
                } else {
                
                    return "\(year) years, \(month) months, \(day) days have passed"
                    
                }
            }
            
        }
    }
    
    return "0 years, 0 months, 0 days have passed"
    
}
