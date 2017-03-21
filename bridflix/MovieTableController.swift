//
//  MovieTableController.swift
//  bridflix
//
//  Created by Gabriel on 20/03/17.
//  Copyright © 2017 bridge. All rights reserved.
//

import Foundation

class MovieTableController : ViewController<MovieTableViewController>{
    
    override init(view _view: MovieTableViewController) {
        super.init(view: _view)
        ServerConnectionManager.getMovies(failFun: onLoadMovieFail,successFun: onLoadMovieSuccess)
    }
    
    func onLoadMovieFail() {
        view.showAlert(alertMessage: "Server comunication problem",view: view)
    }
    
    func onLoadMovieSuccess(movies:[MovieItem]) {
        view.updateTableValue(movies)
    }

}
