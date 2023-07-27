//
//  ViewController.swift
//  Search Bar TableView
//
//  Created by Eren Ates on 27.07.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var countries:[String] = [String]()
    var searchResultCountries:[String] = [String]()
    
    var research = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        countries = ["United States", "United Kingdom", "Canada", "Australia", "New Zealand", "Ireland", "South Africa", "India", "Pakistan", "Nigeria", "France", "Germany", "Spain", "Italy", "China", "Japan", "South Korea", "Brazil", "Mexico", "Russia"]
        
        searchBar.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        
    
    }


}

extension ViewController:UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if research {
            return searchResultCountries.count
        }
        else {
            return countries.count
        }
            
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath)
        
        cell.textLabel?.text = countries[indexPath.row]
        
        if research {
            cell.textLabel?.text = searchResultCountries[indexPath.row]        }
        else {
            cell.textLabel?.text = countries[indexPath.row]
            
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if research {
            print("You Selected Country :  \(searchResultCountries[indexPath.row])")
        }
        else {
            print("You Selected Country :  \(countries[indexPath.row])")
        }
    }
}


extension ViewController:UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        
        print("Search Result :  \(searchText)")
        
        if searchText == "" {
            research = false
        } else {
            research = true
        }
        
        
        searchResultCountries = countries.filter({$0.lowercased().contains(searchText.lowercased())})

        tableView.reloadData()
        
        
    }
    
}
