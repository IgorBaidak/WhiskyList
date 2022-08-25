//
//  Whisky.swift
//  WhiskyList
//
//  Created by Igor Baidak on 23.08.22.
//

import Foundation
import UIKit


struct Whisky {
    
    let whisky: String
    let price: Double
    let image: UIImage?
    
    var feedback: [Feedback] = []
    
    // вычисляемые свойства которые отображают данные
    var ratingBar: String {
        if let rating = rating {
            return String(repeating: "⭐️", count: Int(rating.rounded(.up)))
        } else { return "Отсутствуют отзывы" }
    }
    
    private var rating: Double? {
        if feedback.isEmpty {
            return nil
        } else {
            var sum: Double = 0
            for i in feedback {
                sum += i.raiting
            }
            return sum / Double(feedback.count)
        }
    }
}


