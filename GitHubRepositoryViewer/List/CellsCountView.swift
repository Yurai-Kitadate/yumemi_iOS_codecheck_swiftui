//
//  CellsCountView.swift
//  GitHubRepositoryViewer
//
//  Created by 北舘友頼 on 2023/04/02.
//

import Foundation
import SwiftUI

struct CellsCountView:View{
    var repository : Repository
    var body : some View{
        VStack{
            HStack(spacing:10){
                IconAndCountView(cnt: repository.stargazers_count ?? 0, imageName: "star.fill")
                IconAndCountView(cnt: repository.forks_count ?? 0, imageName: "tuningfork")
                IconAndCountView(cnt: repository.watchers_count ?? 0, imageName: "eye")
                Spacer()
            }
            HStack(spacing:10){
                IconAndCountView(cnt: repository.open_issues_count ?? 0, imageName: "smallcircle.filled.circle")
                HStack(spacing:3){
                    Text("createdAt")
                        .font(.system(size: 12)).bold()
                    Text(":")
                        .font(.system(size: 12)).bold()
                    Text((repository.created_at ?? "").prefix(10))
                        .font(.system(size: 12)).bold()
                    Spacer()
                }
            }
        }
    }
}

struct IconAndCountView:View{
    var cnt : Int?
    var imageName : String
    var body : some View{
        HStack(spacing:3){
            Image(systemName: imageName)
                .resizable()
                .frame(width: 12,height: 12)
            Text("×")
                .font(.system(size: 12)).bold()
            Text(String(cnt ?? 0))
                .font(.system(size: 12)).bold()
            Text("")
        }
    }
}



