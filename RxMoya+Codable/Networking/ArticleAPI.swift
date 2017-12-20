//
//  ArticleAPI.swift
//  RxMoya+Codable
//
//  Created by Masataka Nakagawa on 2017/12/20.
//  Copyright © 2017年 Masataka Nakagawa. All rights reserved.
//

import Moya

enum ArticleAPI {
    case articles
}

extension ArticleAPI: TargetType {
    
    var baseURL: URL {
        return URL(string: "https://qiita.com")!
    }
    
    var path: String {
        return "/api/v2/items"
    }
    
    var method: Moya.Method {
        switch self {
        case .articles:
            return .get
        }
    }
    
    var sampleData: Data {
        let path = Bundle.main.path(forResource: "sample", ofType: "json")!
        return FileHandle(forReadingAtPath: path)!.readDataToEndOfFile()
    }
    
    var task: Task {
        return .requestParameters(parameters: ["page":1], encoding: URLEncoding.default)
    }
    
    var headers: [String : String]? {
        return nil
    }
}

