//
//  RepositoryDetailView.swift
//  GitHubRepositoryViewer
//
//  Created by 北舘友頼 on 2023/03/31.
//

import Foundation
import SwiftUI
struct RepositoryDetailView: View{
    let screen: CGRect = UIScreen.main.bounds
    var repository : Repository
    var image : Image
    var languageColor : Color
    var body : some View{
        VStack{
            HStack{
                image
                    .resizable()
                    .frame(width: 80,height: 80)
                    .padding(10)
                DetailCellView(repository: repository, languageColor: languageColor)
                Spacer()
            }
            Divider()
            DetailItemView(itemName: "description",contentView: Text(repository.description ?? "").padding(5))
            DetailItemView(itemName: "main language",contentView: Text(repository.language ?? "").font(.system(size: 30)).padding(5))
            DetailItemView(itemName: "contributor", contentView: ContributorIconListView())
        }
        
    }
}
