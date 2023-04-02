//
//  ImageViewModek.swift
//  GitHubRepositoryViewer
//
//  Created by 北舘友頼 on 2023/04/01.
//

import Foundation
import UIKit
class ImageViewModel {
    
    var image : UIImage?
    
    func getImage(from urlString: String?) async{
        if let urlString = urlString, let data = await searchFromUrl(searchType: .image, keyWord: urlString) {
            DispatchQueue.main.async{
                self.image = UIImage(data: data)
            }
        }
    }
}
