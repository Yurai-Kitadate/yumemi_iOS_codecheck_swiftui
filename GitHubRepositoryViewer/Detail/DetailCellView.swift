//
//  DetailCellView.swift
//  GitHubRepositoryViewer
//
//  Created by 北舘友頼 on 2023/04/03.
//

import Foundation
import SwiftUI

struct DetailCellView : View{
    var repository : Repository
    var languageColor : Color
    var body : some View{
        VStack(alignment: .leading){
            Text("")
            Text(repository.name ?? "")
                .font(.system(size: 27)).bold()
                .ignoresSafeArea()
                .foregroundColor(languageColor)
            Text(repository.full_name?.split(separator: "/")[0] ?? "unknown owner")
                .font(.system(size: 15))
                .foregroundColor(.gray)
            CellsCountView(repository: repository)
            
            
            
        }
    }
}
