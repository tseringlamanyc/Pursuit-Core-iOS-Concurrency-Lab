//
//  ViewController.swift
//  ConcurrencyLab
//
//  Created by Tsering Lama on 12/5/19.
//  Copyright © 2019 Tsering Lama. All rights reserved.
//

import UIKit

class CountryViewController: UIViewController {
    
    @IBOutlet weak var tableVIew: UITableView!
    @IBOutlet weak var countrySearch: UISearchBar!
    
    
    var countries = [Country]() {
        didSet {
            tableVIew.reloadData()
        }
    }
    
    var currentSearch = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableVIew.dataSource = self
        tableVIew.delegate = self
        countrySearch.delegate = self
        loadData()
    }
    
    func loadData() {
        countries = Country.getCountry()
    }
    
    func searchCountry() {
        countries = Country.getCountry().filter {$0.name.lowercased().contains(currentSearch.lowercased())}
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailViewController, let indexpath = tableVIew.indexPathForSelectedRow else {
            return
        }
        detailVC.country = countries[indexpath.row]
    }


}

extension CountryViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let aCountry = countries[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath) as? DetailCell else {
        fatalError()
    }
        cell.loadCell(country: aCountry)
        return cell
}
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}

extension CountryViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            loadData()
            return
        }
        currentSearch = searchText
        searchCountry()
    }
      
  }
