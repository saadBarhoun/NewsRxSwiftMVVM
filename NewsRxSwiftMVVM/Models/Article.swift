//
//  Article.swift
//  NewsRxSwiftMVVM
//
//  Created by Saad barhoun on 17/12/2021.
//

import Foundation

struct ArticlesList: Decodable {
    let results: [Article]
}

struct Article: Decodable {
    let title: String
    let byline:String
    let media: [Media]
    let url: String
    let updated: String
    let abstract: String
    let published_date: String
}
