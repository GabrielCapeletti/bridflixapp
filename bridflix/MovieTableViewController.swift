//
//  MovieTableViewController.swift
//  bridflix
//
//  Created by Gabriel on 17/03/17.
//  Copyright © 2017 bridge. All rights reserved.
//

import Foundation
import UIKit

public class MovieTableViewController:UIViewController,AlertNotifierView,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate{
    
    var value: [MovieItem] = []
    
    var valueFiltred: [MovieItem] = []
    
    var controller : MovieTableController?
    
    var searchBar : UISearchBar?
    
    var filterString: String = ""
    
    var tableView : UITableView?
        override public func viewDidLoad() {
        super.viewDidLoad()
            
        let stack: UIStackView = UIStackView(frame: UIScreen.main.bounds)
            
        searchBar = UISearchBar(frame: CGRect(x: 0, y: 17, width: UIScreen.main.bounds.width, height: 50))
        searchBar?.delegate = self
        stack.addSubview(searchBar!)
            
            
        controller = MovieTableController(view: self)
        tableView = UITableView(frame: CGRect(x: 0, y: 68, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-70), style: UITableViewStyle.plain)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.register(MovieTableCell.self, forCellReuseIdentifier: "MovieCell")
        stack.addSubview(tableView!)
            
        view.addSubview(stack)
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    public func updateTableValue(_ movies:[MovieItem]){
        searchBar?.text = ""
        value = movies
        valueFiltred = value
        tableView?.reloadData()
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : MovieTableCell = MovieTableCell(style: UITableViewCellStyle.default, reuseIdentifier: "MovieCell")
        cell.setFieldValue(value: valueFiltred[indexPath.row])
        return cell
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return valueFiltred.count
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {// called when text changes (including clear)
        filterString = searchText
        if filterString.isEmpty {
            valueFiltred = value
            tableView?.reloadData()
        }else{
            filterTable()
        }
    }

    func filterTable(){
        valueFiltred=[]
        for item:MovieItem in value {
            if(item.name?.contains(filterString))!{
                valueFiltred.append(item)
            }
        }
        tableView?.reloadData()
    }
}
