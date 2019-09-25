//
//  ChDateTime.swift
//  ARC
//
//  Created by Pawan Kumar on 25/09/19.
//  Copyright © 2019 Pawan Kumar. All rights reserved.
//

import Foundation

public class ChDateTime{


    public func StringConvertIntoDate(Date : String, DateFormat : String) -> (Date){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormat //Your date format
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC") //Current time zone
        let final = dateFormatter.date(from: Date)
        return final!
       
    }
    
    public func DateConvertIntoString(Date : Date,Format : String) -> String{
        
        let formatter = DateFormatter()
        formatter.dateFormat = Format
        formatter.timeZone = TimeZone(abbreviation: "UTC") //Current time zone
        let myString = formatter.string(from: Date)
        return myString
    }
    
    
    public func SecondConvertIntoDayHourMinuteSecond(Seconds : Int) -> (Day : String, Hour : String, Minutes : String, Second : String) {
        
        let Day = String((Seconds / 86400))
        let Hour = String((Seconds % 86400) / 3600)
        let Minutes = String((Seconds % 3600) / 60)
        let Second = String((Seconds % 3600) % 60)
        return (Day, Hour, Minutes, Second)
    }
    
    public  func TimeDiffernceBetweenTwoDate(fromfirstDate: Date, tosecondDate: Date) -> (Year: Int, Month: Int,Day: Int,Hour: Int, Minute: Int,Second: Int) {

        let Year = Calendar.current.dateComponents([.year], from: fromfirstDate, to: tosecondDate).year ?? 0
        let Month = Calendar.current.dateComponents([.month], from: fromfirstDate, to: tosecondDate).month ?? 0
        let Day = Calendar.current.dateComponents([.day], from: fromfirstDate, to: tosecondDate).day ?? 0
        let Hour = Calendar.current.dateComponents([.hour], from: fromfirstDate, to: tosecondDate).hour ?? 0
        let Minute = Calendar.current.dateComponents([.minute], from: fromfirstDate, to: tosecondDate).minute ?? 0
        let Second = Calendar.current.dateComponents([.second], from: fromfirstDate, to: tosecondDate).second ?? 0
        return (Year, Month, Day, Hour, Minute, Second)
    }


    
    public func DateFormatChange(Date : String,CurrentFormat : String,FormatNeed : String) -> String{
        
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = CurrentFormat
        inputFormatter.timeZone = TimeZone(abbreviation: "UTC") //Current time zone
        let showDate = inputFormatter.date(from: Date)
        inputFormatter.dateFormat = FormatNeed
        let DateChange = inputFormatter.string(from: showDate!)
        return DateChange
    }
    
   public func LocalTimeZoneGet() -> String{
        let dtf = DateFormatter()
        dtf.timeZone = TimeZone.current
        dtf.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dtf.string(from: Date())
    }
    
   public func TimeStampGet(InputDate : Date) -> Double{
        let currentTimeStamp  =  InputDate.timeIntervalSince1970
        return currentTimeStamp
    }
    
   public func TimeStampConvertInToLocalTimeZone(InputTimeStamp : Double) -> String{
        
        let date = Date(timeIntervalSince1970: Double(InputTimeStamp))
        let dateFormatt = DateFormatter();
        dateFormatt.dateFormat = "yyyy-MM-dd HH:mm:ssZ"
        dateFormatt.timeZone = NSTimeZone.local
        let CurrentTimeFromTimeStamp = dateFormatt.string(from: date as Date)
        return CurrentTimeFromTimeStamp
    }
    
}
