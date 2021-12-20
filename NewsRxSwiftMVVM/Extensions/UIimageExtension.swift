//
//  UIimageExtension.swift
//  NewsRxSwiftMVVM
//
//  Created by Saad barhoun on 17/12/2021.
//

import Foundation
import UIKit

extension UIImageView {
    func load(url: String) {
        guard let url = URL(string: url) else {
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
