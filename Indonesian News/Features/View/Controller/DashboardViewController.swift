//
//  ViewController.swift
//  Indonesian News
//
//  Created by yoviekaputra on 02/05/20.
//  Copyright © 2020 multipolar. All rights reserved.
//

import UIKit
import RxSwift
import Moya

class DashboardViewController : BaseViewController {
    @IBOutlet weak var tableView: NewsTableView!
    
    private var viewModel: DashboardViewModel!
    private var disposable = DisposeBag()
    private var service: NewsService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupUI()
    }
    
    private func setupData() {
        service = NewsService(provider: MoyaProvider<NewsApi>())
        viewModel = DashboardViewModel(disposable: disposable, service: service)
        
        setupObserver()
        viewModel.getTopHighlight()
    }
    
    private func setupUI() {
        
    }
}

extension DashboardViewController {
    private func setupObserver() {
        viewModel.loadingObserver.observe(disposable) { data in
            self.showLoader(data)
        }
        
        viewModel.errorObserver.observe(disposable) { message in
            self.showAlertError(message)
        }
        
        viewModel.newsObserver.observe(disposable) { response in
            self.tableView.addTopHidelinesItem(news: response?.articles)
            self.tableView.addItemGenericNews(news: response?.articles)
        }
        
        tableView.itemSelected.observe(disposable) { news in
            print(news?.author)
        }
    }
}
