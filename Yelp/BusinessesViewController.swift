//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{
    
    
    
    
    @IBOutlet weak var tabelView: UITableView!
    var businesses: [Business] = []
    let searchBar = UISearchBar()
    override func viewDidLoad() {
        searchBar.delegate = self
        searchBar.sizeToFit()
        navigationItem.titleView = searchBar
        
        //searchDisplayController?.displaysSearchBarInNavigationBar = true
        
        super.viewDidLoad()
        tabelView.sizeToFit()
        
        tabelView.dataSource = self
        tabelView.delegate = self
        //tableView.rowHeight = UITableViewAutomaticDimension
        //  tableView.estimatedRowHeight = 120
        
        
        Business.searchWithTerm(term: "Thai", completion: { (businesses: [Business]?, error: Error?) -> Void in
            
            self.businesses = businesses!
            self.tabelView.reloadData()
            if let businesses = businesses {
                for business in businesses {
                    print(business.name!)
                    print(business.address!)
                }
            }
            
        }
        )
        
        /* Example of Yelp search with more search options specified
         Business.searchWithTerm("Restaurants", sort: .distance, categories: ["asianfusion", "burgers"], deals: true) { (businesses: [Business]!, error: Error!) -> Void in
         self.businesses = businesses
         
         for business in businesses {
         print(business.name!)
         print(business.address!)
         }
         }
         */
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return businesses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tabelView.dequeueReusableCell(withIdentifier: "BusinessCell", for: indexPath) as! BusinessCell
        cell.business = businesses[indexPath.row]
        return cell
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // When there is no text, filteredData is the same as the original data
        // When user has entered text into the search box
        // Use the filter method to iterate over all items in the data array
        // For each item, return true if the item should be included and false if the
        // item should NOT be included
        Business.searchWithTerm(term: searchText, completion: { (businesses: [Business]?, error: Error?) -> Void in
            
            self.businesses = businesses!
            self.tabelView.reloadData()
            if let businesses = businesses {
                for business in businesses {
                    print(business.name!)
                    print(business.address!)
                }
            }
            
        }
        )
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}
