//
//  ArticleListViewModel.swift
//  NewsRxSwiftMVVM
//
//  Created by Saad barhoun on 17/12/2021.
//

import Foundation
import RxCocoa
import RxSwift

struct ArticleListViewModel {
    let articleListVM: [ArticleViewModel]
    
    init(_ articles: [Article]) {
        self.articleListVM = articles.compactMap(ArticleViewModel.init)
    }
    
    func articleAt(_ index: Int) -> ArticleViewModel{
        return self.articleListVM[index]
    }
}
