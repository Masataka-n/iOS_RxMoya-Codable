//
//  ArticleListCoordinator.swift
//  RxMoya+Codable
//
//  Created by Masataka Nakagawa on 2017/12/20.
//  Copyright © 2017年 Masataka Nakagawa. All rights reserved.
//

import UIKit

final class ArticleListCoordinator: Coordinator {
    
    var appCoordinator: AppCoordinator?
    
    convenience init(navigationController: UINavigationController?, appCoordinator: AppCoordinator) {
        self.init(navigationController: navigationController)
        
        self.appCoordinator = appCoordinator
    }
    
    func start() {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "root") as! ArticleListViewController
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func stop() {
        _ = navigationController?.popViewController(animated: true)
        appCoordinator?.articleListCoordinatorCompleted(coordinator: self)
    }
}

