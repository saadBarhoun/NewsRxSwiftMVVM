//
//  DetailsViewModels.swift
//  NewsRxSwiftMVVM
//
//  Created by Saad barhoun on 18/12/2021.
//

import Foundation
import RxSwift

struct DetailsViewModel {
    
    private let article : Article
    
    init(_ article: Article) {
        self.article = article
    }
    
    var abstract: Observable<String>{
        return Observable<String>.just(self.article.abstract)
    }
    
    var url: Observable<String>{
        return Observable<String>.just(self.article.url)
    }
    
    var media: Observable<String>{
        return Observable<String>.just(article.media.first?.mediametadata[2].url ?? Constants.imageURL)
    }
    
    
    
    
}

