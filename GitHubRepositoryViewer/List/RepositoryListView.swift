//
//  RepositoryListView.swift
//  GitHubRepositoryViewer
//
//  Created by 北舘友頼 on 2023/03/31.
//

import Foundation
import SwiftUI

struct RepositoryListView :View{
    var repositoryViewModel = RepositoriesViewModel()
    var imageViewModel = ImageViewModel()
    
    @State var repositories : Repositories?
    var images : [UIImage]?
    @State var name : String = ""
    
    var body : some View{
        NavigationView{
                VStack(spacing : 5){
                    Text("リポジトリ検索").searchable(text: $name).onSubmit {
                        Task.init{
                            await repositoryViewModel.load(searchBarWord:name)
                            self.repositories = repositoryViewModel.repositories
                            
                        }
                    }
                }
            ScrollView{
                if let repositories = repositories{
                    ForEach((0..<repositories.items.count), id: \.self) { i in
                        RepositoryListCellView(repository: repositories.items[i]!)
                    }
                }
            }
        }
    }
}
