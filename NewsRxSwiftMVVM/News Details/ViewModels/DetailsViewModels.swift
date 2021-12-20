//
//  DetailsViewModels.swift
//  NewsRxSwiftMVVM
//
//  Created by Saad barhoun on 18/12/2021.
//

import Foundation
import RxSwift

struct DetailsViewModel {
    
    var article : Article
    //var articles : [Article]?
    init(_ article: Article) {
        self.article = article
    }
    var title: Observable<String>{
        return Observable<String>.just(article.title)
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
    
    var updated: Observable<String>{
        return Observable<String>.just(self.article.updated)
    }
    
    var section: Observable<String>{
        return Observable<String>.just(self.article.section)
    }
    
//    func articleAtIndex(_ index: Int) -> DetailsViewModel? {
//        guard let articles = articles else { return nil}
//        let article = articles[index]
//        return DetailsViewModel(article)
//    }
    
}

