//
//  NewsDetailsViewController.swift
//  NewsRxSwiftMVVM
//
//  Created by Saad barhoun on 18/12/2021.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa


class NewsDetailsViewController: UIViewController {
   
    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var abstractLabel: UILabel!
    
    var detailsVM = DetaislListViewModel()
    let disposeBag = DisposeBag()
    var index: Int = 0
    var urlString: String = ""
    let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
    override func viewDidLoad() {
        super.viewDidLoad()

       // loader()
        populate()
    }
    
    @IBAction func goToUrl(_ sender: Any) {
        UIApplication.shared.open(NSURL(string: urlString)! as URL)
    }
    
    private func populate(){
        
        let resource = Constants.resource
        URLRequest.load(resource: resource)
            .subscribe(onNext: { articlesResponse in
                let articles = articlesResponse.results
                self.detailsVM = DetaislListViewModel(articles: articles)
                
                DispatchQueue.main.async {
                    let detailsVM = self.detailsVM.articleAtIndex(self.index)

                    detailsVM?.abstract.asDriver(onErrorJustReturn: "hii")
                        .drive(self.abstractLabel.rx.text)
                        .disposed(by: self.disposeBag)
                    
                    detailsVM?.media.subscribe(onNext:{ imageUrl in
                        self.imageV.load(url: imageUrl)
                       // self.alert.dismiss(animated: true, completion: nil)
                    }).disposed(by: self.disposeBag)
                    
                    detailsVM?.url.subscribe(onNext:{ url in
                        self.urlString = url
                    }).disposed(by: self.disposeBag)
                    //self.alert.dismiss(animated: true, completion: nil)
                }
                
            }).disposed(by: disposeBag)
    }
    
    func loader() -> UIAlertController {
            let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
            loadingIndicator.hidesWhenStopped = true
            loadingIndicator.style = UIActivityIndicatorView.Style.large
            loadingIndicator.startAnimating()
            alert.view.addSubview(loadingIndicator)
            present(alert, animated: true, completion: nil)
            return alert
        }
}
