//
//  RepositoryListView.swift
//  GitHubRepositoryViewer
//
//  Created by 北舘友頼 on 2023/03/31.
//

import Foundation
import SwiftUI

struct RepositoryListView :View{
    let screen: CGRect = UIScreen.main.bounds
    var repositoryViewModel = RepositoriesViewModel()
    var imageViewModel = ImageViewModel()
    var languageColor = LanguageColor()
    @State var repositories : Repositories?
    @State var searchWord : String = ""
    @State var isSearched = false
    var body : some View{
        
        ScrollView{
            ZStack{
                VStack{
                    HStack{
                        Text("Repository")
                            .font(.system(size: 40)).bold()
                            .padding(20)
                        Spacer()
                    }
                    
                    HStack{
                        Image(systemName: "magnifyingglass.circle")
                            .resizable()
                            .frame(width: 30, height: 30)
                        TextField("リポジトリ検索", text: $searchWord)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width:screen.width/1.2)
                            .onSubmit {
                                Task.init{
                                    repositories = nil
                                    isSearched = true
                                    await repositoryViewModel.load(searchBarWord:searchWord)
                                    self.repositories = repositoryViewModel.repositories
                                    
                                }
                            }.padding(5)
                    }
                    if let repositories = repositories{
                        ForEach((0..<repositories.items.count), id: \.self) { i in
                            Rectangle()
                                .frame(height:0.5)
                                .foregroundColor(.gray)
                            
                            RepositoryListCellView(repository: repositories.items[i]!,languageColor: languageColor.languagesMap[repositories.items[i]!.language ?? "a"] ?? Color.black)
                            
                        }
                    }else if isSearched == false{
                        Text("気になるリポジトリを検索しよう！")
                            .bold()
                            .foregroundColor(.gray)
                    }else{
                        ProgressView("Loading repositories...")
                    }
                }
            }
        }
    }
}

