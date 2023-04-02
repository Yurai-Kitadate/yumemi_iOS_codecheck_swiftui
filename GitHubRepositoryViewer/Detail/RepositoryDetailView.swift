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
            DetailItemView(itemName: "description",contentView: Text(repository.description ?? "no data").padding(5))
            DetailItemView(itemName: "main language",contentView: Text(repository.language ?? "no data") .foregroundColor(languageColor).font(.system(size: 30)).bold().padding(5))
            DetailItemView(itemName: "link",contentView: Link("https://github.com/" + (repository.full_name ?? ""), destination: URL(string: "https://github.com/" + (repository.full_name ?? ""))!).font(.system(size: 20)).padding(5))
        }
        
    }
}
