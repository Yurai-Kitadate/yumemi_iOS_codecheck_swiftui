//
//  Main.swift
//  GitHubRepositoryViewer
//
//  Created by 北舘友頼 on 2023/04/01.
//

import Foundation
import SwiftUI
struct MainView : View{
    init() {
        let appearance: UITabBarAppearance = UITabBarAppearance()
        appearance.configureWithDefaultBackground()
        UITabBar.appearance().scrollEdgeAppearance = appearance
        UITabBar.appearance().standardAppearance = appearance
    }
    
    @State private var selection : Int = 0
    var body: some View{
        
        
        RepositoryListView()
        
    }
}
