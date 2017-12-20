//
//  ArticleViewModel.swift
//  RxMoya+Codable
//
//  Created by Masataka Nakagawa on 2017/12/20.
//  Copyright © 2017年 Masataka Nakagawa. All rights reserved.
//

import Moya
import RxSwift

protocol ArticleViewModelInputs {
    func viewDidLoad()
    func refresh()
}

protocol ArticleViewModelOutputs {
    var articles: Observable<[Article]> { get }
    var isLoading: Variable<Bool> { get }
}

protocol ArticleViewModelType {
    var inputs: ArticleViewModelInputs { get }
    var outputs: ArticleViewModelOutputs { get }
}

final class ArticleViewModel: ArticleViewModelType, ArticleViewModelInputs, ArticleViewModelOutputs {
    
    var inputs: ArticleViewModelInputs { return self }
    
    var outputs: ArticleViewModelOutputs { return self }
    
    var articles: Observable<[Article]> = Observable.empty()
    
    var isLoading = Variable(false)
    
    fileprivate let provider: MoyaProvider<ArticleAPI> = {
        let stubClosure = { (target: ArticleAPI) -> StubBehavior in
            return .never
        }
        let networkLoggerPlugin = NetworkLoggerPlugin(cURL: true)
        let plugins = [networkLoggerPlugin]
        return MoyaProvider<ArticleAPI>(stubClosure: stubClosure, plugins: plugins)
    }()
    
    private let disposeBag = DisposeBag()
    
    func viewDidLoad() {
        self.getArticleList()
    }
    
    func refresh() {
        self.getArticleList()
    }
    
    func getArticleList() {
        let articleSubject = PublishSubject<[Article]>()
        self.articles = articleSubject.asObservable()
        
        self.provider.rx.request(.articles).subscribe { event in
            switch event {
            case .success(let response):
                do {
                    let decoder = JSONDecoder()
                    let article = try decoder.decode([Article].self, from: response.data)
                    articleSubject.onNext(article)
                } catch(let error) {
                    articleSubject.onError(error)
                }
            case .error(let error):
                 articleSubject.onError(error)
            }
        }.disposed(by: disposeBag)
    }
}

