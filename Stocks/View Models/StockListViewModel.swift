//
//  StockListViewModel.swift
//  Stocks
//
//  Created by Juan Francisco Dorado Torres on 25/08/20.
//  Copyright © 2020 Juan Francisco Dorado Torres. All rights reserved.
//

import Foundation

class StockListViewModel: ObservableObject {

  var searchTerm = ""
  @Published var stocks = [StockViewModel]()

  func load() {
    fetchStocks()
  }

  private func fetchStocks() {
    StockService.getStocks { (result) in
      switch result {
      case .success(let stocks):
        DispatchQueue.main.async {
          self.stocks = stocks.map(StockViewModel.init)
        }
      case .failure(let error):
        print(error.localizedDescription)
      }
    }
  }
}
