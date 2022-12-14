//
//  DateExtensions.swift
//  ProjBornlogic
//
//  Created by Jonathan Alajoan Nascimento Rocha on 17/08/22.
//

import Foundation

extension Date {
    static func getFormattedDate(string: String) -> String{
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd/MM/YYYY"
        
        guard let date = dateFormatterGet.date(from: string) else { return "" }
        return dateFormatterPrint.string(from: date);
    }
}
