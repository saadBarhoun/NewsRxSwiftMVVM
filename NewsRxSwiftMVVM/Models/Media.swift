//
//  Media.swift
//  NewsRxSwiftMVVM
//
//  Created by Saad barhoun on 17/12/2021.
//

import Foundation

struct Media: Decodable {
    let mediametadata: [metadata]
    
    enum CodingKeys: String, CodingKey {
            case mediametadata = "media-metadata"
    }
}
