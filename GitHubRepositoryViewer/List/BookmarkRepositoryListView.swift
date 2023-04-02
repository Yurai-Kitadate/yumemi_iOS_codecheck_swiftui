//
//  RepositoryListView.swift
//  GitHubRepositoryViewer
//
//  Created by 北舘友頼 on 2023/03/31.
//

import Foundation
import SwiftUI

struct BookmarkRepositoryListView :View{
    let screen: CGRect = UIScreen.main.bounds
    var imageViewModel = ImageViewModel()
    
    @State var repositories : Repositories = Repositories(total_count: 3, incomplete_results: false, items: [Repository(name: "a", full_name: "apple/swift", owner: Owner(avatar_url: "a"), stargazers_count: 3, watchers_count: 3, language: "swifttt", forks_count: 3, open_issues_count: 3,description : "aaa",created_at: "a")])
    var images : [UIImage] = []
    @State var name : String = ""
    
    var body : some View{
        
        ScrollView{
            ZStack{
                VStack{
                    HStack{
                        Text("Bookmark")
                            .font(.system(size: 40)).bold()
                            .padding(20)
                        Spacer()
                    }
                    
                    if let repositories = repositories{
                        ForEach((0..<repositories.items.count), id: \.self) { i in
                            
                        }
                        
                        
                    }
                }
            }
        }
    }
}
