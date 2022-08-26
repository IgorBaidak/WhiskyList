//
//  WhiskyDate.swift
//  WhiskyList
//
//  Created by Igor Baidak on 23.08.22.
//

import Foundation
// типо база данных
class WhiskyDate {
    // создаем Singletone
    static let shared = WhiskyDate()
    
    var whisky: [Whisky]
    
    private init() {
        whisky = [Whisky(whisky: "Laphroig", price: 50.0, image: #imageLiteral(resourceName: "Laphroaig")),
                  Whisky(whisky: "Ardbeg10", price: 70.0, image: #imageLiteral(resourceName: "Ardbeg10.jpeg")),
                  Whisky(whisky: "Bigpeat", price: 55.0, image: #imageLiteral(resourceName: "Bigpeat.png"))]
    }
}
