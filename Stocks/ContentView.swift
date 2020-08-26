//
//  ContentView.swift
//  Stocks
//
//  Created by Juan Francisco Dorado Torres on 25/08/20.
//  Copyright © 2020 Juan Francisco Dorado Torres. All rights reserved.
//

import SwiftUI

struct ContentView: View {

  @ObservedObject private var stockListVM = StockListViewModel()

  init() {
    UINavigationBar.appearance().backgroundColor = .black
    UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    UITableView.appearance().backgroundColor = .black
    UITableViewCell.appearance().backgroundColor = .black

    stockListVM.load()
  }

  var body: some View {
    NavigationView {
      ZStack(alignment: .leading) {
        Color.black
        Text("January 5 2020")
          .font(.custom("Arial", size: 32))
          .fontWeight(.bold)
          .foregroundColor(Color.gray)
          .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
          .offset(y: -400)

        SearchView(searchTerm: self.$stockListVM.searchTerm)
          .offset(y: -350)

        StockListView(stocks: self.stockListVM.stocks)
          .offset(y: 150)
      }
      .navigationBarTitle("Stocks")
    }
    .edgesIgnoringSafeArea(Edge.Set(.bottom))
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
