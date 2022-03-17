//
//  ViewController.swift
//  URLSESSIONPlay
//
//  Created by Nathaniel Whittington on 3/15/22.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var vm = ViewModel()
    var ifSearch : Bool = false
    var filteredArray = [Post]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vm.get {
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
         }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource{
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(ifSearch){
            return vm.returnArrCount() ?? 0
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell else {return UITableViewCell()}
    
       
        cell.dateL.text = vm.returnSingleArrTitle(index: indexPath.row)
        cell.titleL.text = vm.returnSingleArrBody(index: indexPath.row)
        
        return cell
        
    }

}

extension ViewController : UISearchBarDelegate, UISearchDisplayDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.isEmpty{
            ifSearch = false
        }else{
            
        }
      
    }
    
}
