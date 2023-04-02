//
//  Repository.swift
//  GitHubRepositoryViewer
//
//  Created by 北舘友頼 on 2023/03/31.
//

import Foundation

struct Repositories : Decodable{
    let total_count : Int?
    let incomplete_results : Bool?
    let items : [Repository?]
}

struct Repository : Decodable{
    let name : String?
    let full_name : String?
    let owner : Owner?
    let stargazers_count : Int?
    let watchers_count : Int?
    let language : String?
    let forks_count : Int?
    let open_issues_count : Int?
    let description : String?
    let created_at : String?
}

struct Owner : Decodable{
    let avatar_url : String?
}
