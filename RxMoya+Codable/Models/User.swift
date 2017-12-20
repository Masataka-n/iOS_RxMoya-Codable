//
//  User.swift
//  RxMoya+Codable
//
//  Created by Masataka Nakagawa on 2017/12/20.
//  Copyright © 2017年 Masataka Nakagawa. All rights reserved.
//

import Foundation

struct User: Codable {
    
    let description: String?
    let facebookID: String?
    let followeesCount: Int
    let followersCount: Int
    let githubLoginName: String?
    let id: String
    let itemsCount: Int
    let linkedinID: String?
    let location: String?
    let name: String
    let organization: String?
    let permanentID: Int
    let profileImageURL: String
    let twitterScreenName: String?
    let websiteURL: String?
    
    private enum CodingKeys: String, CodingKey {
        case description
        case facebookID = "facebook_id"
        case followeesCount = "followees_count"
        case followersCount = "followers_count"
        case githubLoginName = "github_login_name"
        case id
        case itemsCount = "items_count"
        case linkedinID = "linkedin_id"
        case location
        case name
        case organization
        case permanentID = "permanent_id"
        case profileImageURL = "profile_image_url"
        case twitterScreenName = "twitter_screen_name"
        case websiteURL = "website_url"
    }
}

