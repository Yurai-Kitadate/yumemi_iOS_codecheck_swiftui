//
//  RepositoryCellContentView.swift
//  GitHubRepositoryViewer
//
//  Created by 北舘友頼 on 2023/04/03.
//

import Foundation
import SwiftUI

struct RepositoryCellContentView : View{
    var repository : Repository
    var image : Image
    var languageColor : Color
    var body : some View{
        HStack{
            image
                .resizable()
                .frame(width: 80,height: 80)
                .padding(10)
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
                ZStack{
                    Color(.gray).opacity(0.12).cornerRadius(5)
                    Text(repository.description ?? "")
                        .lineLimit(1)
                }
                
                
                
            }
            Spacer()
        }
        
    }
}
