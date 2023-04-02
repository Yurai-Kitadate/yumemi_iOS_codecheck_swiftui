//
//  DetailItemView.swift
//  GitHubRepositoryViewer
//
//  Created by 北舘友頼 on 2023/04/02.
//

import Foundation
import SwiftUI
struct DetailItemView<Content: View>:View{
    var itemName : String
    var contentView : Content
    var body:some View {
        ZStack{
            Color(.gray).opacity(0.12).cornerRadius(10).padding(10)
            VStack{
                HStack{
                    Text(itemName).bold()
                    Spacer()
                }
                //Text(text ?? "no data").padding(5)
                contentView
                
            }.padding(20)
        }
    }
}
