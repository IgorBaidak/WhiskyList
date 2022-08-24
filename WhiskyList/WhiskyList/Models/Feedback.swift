//
//  Feedback.swift
//  WhiskyList
//
//  Created by Igor Baidak on 23.08.22.
//

import Foundation

struct Feedback {
    
    private let date = Date()
    
    let text: String
    let raiting: Double
    
    var ratingBar: String {
            String(repeating: "⭐️", count: Int(raiting.rounded(.up)))
        }
    
    var dateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale(identifier: "ru_Ru")
        return dateFormatter.string(from: date)
    }
}
