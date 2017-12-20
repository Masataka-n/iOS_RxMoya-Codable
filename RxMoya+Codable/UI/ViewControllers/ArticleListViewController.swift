//
//  ArticleListViewController.swift
//  RxMoya+Codable
//
//  Created by Masataka Nakagawa on 2017/12/20.
//  Copyright © 2017年 Masataka Nakagawa. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ArticleListViewController: UIViewController {

    private let refresh = UIRefreshControl()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var reloadButton: UIBarButtonItem!
    
    private var viewModel: ArticleViewModelType!
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupLayout()
        self.setupBindings()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupLayout() {
        self.setupTableView()
    }
    
    private func setupTableView() {
        self.tableView.addSubview(refresh)
        self.tableView.tableFooterView = UIView()
        self.tableView.register(UINib(nibName: "ArticleListCell", bundle: nil), forCellReuseIdentifier: "Cell")
    }
    
    private func setupBindings() {
        self.viewModel = ArticleViewModel()
        self.viewModel.inputs.viewDidLoad()
        self.viewModel.outputs.articles.bind(to: tableView.rx.items) { (tableView, row, element) in
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! ArticleListCell
            cell.setupCellData(article: element)
            return cell
            }.disposed(by: disposeBag)
        
        self.refresh.rx.controlEvent(.valueChanged).bind {
            self.viewModel.inputs.refresh()
            }.disposed(by: disposeBag)
        
        self.reloadButton.rx.tap.asObservable().bind {
            self.viewModel.inputs.refresh()
            }.disposed(by: disposeBag)
    }
}
