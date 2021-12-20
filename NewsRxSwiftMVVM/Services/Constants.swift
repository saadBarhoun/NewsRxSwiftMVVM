//
//  Constant.swift
//  NewsRxSwiftMVVM
//
//  Created by Saad barhoun on 17/12/2021.
//

import Foundation

enum Constants{
    static let resource = Resource<ArticlesList>(url: URL(string: "https://api.nytimes.com/svc/mostpopular/v2/emailed/7.json?api-key=mEytDezhDVBdu74nxOwkX9foc5S8sSue")!)
    static let imageURL = "https://e7.pngegg.com/pngimages/786/489/png-clipart-the-new-york-times-company-new-york-city-news-journalist-new-york-icons-logo-monochrome.png"
}
