//
//  ViewController.swift
//  NewsRxSwiftMVVM
//
//  Created by Saad barhoun on 17/12/2021.
//

import UIKit
import RxSwift

class TableViewController: UITableViewController {

    let disposeBag = DisposeBag()
    var articleListVm: ArticleListViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.prefersLargeTitles = true
        populate()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVm == nil ? 0:  self.articleListVm.articleListVM.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as? CellLabels
        else {fatalError()}
        
        let articleVM = self.articleListVm.articleAt(indexPath.row)
        
        articleVM.title.asDriver(onErrorJustReturn: "")
            .drive(cell.titleLabel.rx.text)
            .disposed(by: disposeBag)
        
        articleVM.byline.asDriver(onErrorJustReturn: "")
            .drive(cell.descLabel.rx.text)
            .disposed(by: disposeBag)
        
        articleVM.media.subscribe(onNext:{ imageUrl in
            cell.imageV.load(url: imageUrl)
        }).disposed(by: disposeBag)
        
        cell.imageV.layer.borderWidth = 1
        cell.imageV.layer.masksToBounds = false
        cell.imageV.layer.borderColor = UIColor.black.cgColor
        cell.imageV.layer.cornerRadius = cell.imageV.frame.height/2
        cell.imageV.clipsToBounds = true
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! NewsDetailsViewController
//        secondViewController.detailsVM?.abstract.asDriver(onErrorJustReturn: "")
//            .drive(secondViewController.abstractLabel.rx.text)
//            .disposed(by: disposeBag)
        secondViewController.index = indexPath.row
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    private func populate(){
        
        let resource = Constants.resource
        URLRequest.load(resource: resource)
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { articlesResponse in
                let articles = articlesResponse.results
                self.articleListVm = ArticleListViewModel(articles)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }).disposed(by: disposeBag)
    }

}

