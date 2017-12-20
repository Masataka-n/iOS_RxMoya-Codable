//
//  Article.swift
//  RxMoya+Codable
//
//  Created by Masataka Nakagawa on 2017/12/20.
//  Copyright © 2017年 Masataka Nakagawa. All rights reserved.
//

import Foundation

struct Article: Codable {
    
    let body : String?
    let coediting : Bool?
    let commentsCount : Int?
    let createdAt : String?
    let group : Group?
    let id : String?
    let likesCount : Int?
    let privateField : Bool?
    let reactionsCount : Int?
    let renderedBody : String?
    let tags : [Tag]?
    let title : String?
    let updatedAt : String?
    let url : String?
    let user : User?
    
    private enum CodingKeys: String, CodingKey {
        case body
        case coediting
        case commentsCount = "comments_count"
        case createdAt = "created_at"
        case group
        case id
        case likesCount = "likes_count"
        case privateField = "private"
        case reactionsCount = "reactions_count"
        case renderedBody = "rendered_body"
        case tags
        case title
        case updatedAt = "updated_at"
        case url
        case user
    }
}

struct Tag: Codable {
    
    let name : String?
    let versions : [String]?
    
    private enum CodingKeys: String, CodingKey {
        case name
        case versions
    }
}

struct Group: Codable {
    
    let createdAt : String?
    let id : Int?
    let name : String?
    let privateField : Bool?
    let updatedAt : String?
    let urlName : String?
    
    private enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case id
        case name
        case privateField = "private"
        case updatedAt = "updated_at"
        case urlName = "url_name"
    }
}
