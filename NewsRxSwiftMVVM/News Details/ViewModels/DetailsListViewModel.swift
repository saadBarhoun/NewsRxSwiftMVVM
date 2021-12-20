//
//  DetailsListViewModel.swift
//  NewsRxSwiftMVVM
//
//  Created by Saad barhoun on 20/12/2021.
//

import Foundation

struct DetaislListViewModel {
    var articles : [Article]?
    var detailsListVM: [DetailsViewModel]?
    

    func articleAtIndex(_ index: Int) -> DetailsViewModel? {
        guard let articles = articles else { return nil}
        let article = articles[index]
        return DetailsViewModel(article)
    }
}
