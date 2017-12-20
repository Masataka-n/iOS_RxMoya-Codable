//
//  AppCoordinator.swift
//  RxMoya+Codable
//
//  Created by Masataka Nakagawa on 2017/12/20.
//  Copyright © 2017年 Masataka Nakagawa. All rights reserved.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    func start() {
        let coordinator = ArticleListCoordinator(navigationController: navigationController, appCoordinator: self)
        coordinator.start()
        childCoordinators.append(coordinator)
    }
    
    func articleListCoordinatorCompleted(coordinator: ArticleListCoordinator) {
        if let index = childCoordinators.index(where: { $0 === coordinator}) {
            childCoordinators.remove(at: index)
        }
    }
}

