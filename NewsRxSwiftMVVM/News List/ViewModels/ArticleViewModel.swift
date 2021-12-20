//
//  ArticleViewModel.swift
//  NewsRxSwiftMVVM
//
//  Created by Saad barhoun on 17/12/2021.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

struct ArticleViewModel {
    let article: Article
    init(_ article: Article) {
        self.article = article
    }
}

extension ArticleViewModel {
    var title: Observable<String>{
        return Observable<String>.just(article.title)
    }
    var byline: Observable<String>{
        return Observable<String>.just(article.byline)
    }
    var media: Observable<String>{
        return Observable<String>.just(article.media.first?.mediametadata[0].url ?? Constants.imageURL)
    }
    
}


