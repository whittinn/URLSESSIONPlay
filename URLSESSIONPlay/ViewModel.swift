//
//  ViewModel.swift
//  URLSESSIONPlay
//
//  Created by Nathaniel Whittington on 3/15/22.
//

import Foundation



class ViewModel {
    
    var error : Error?
    typealias completionHandler = (()->())
    var arr : [Post]?
    var emptyArr = [Post]()
    
    func get(completion: @escaping completionHandler){
        
        APIHandler.shared.get {[weak self] data in
            guard let strongSelf = self else {return}
            switch data{
            case .success(let data):
                do {
                    let arr =  try JSONDecoder().decode([Post].self, from: data)
                    
                    strongSelf.setArr(arr: arr)
                    
                    completion()
                } catch let error {
                    print(error)
                    
                }
            case .failure(let error):
                print(error)
            }
        }

    }
    func setArr(arr:[Post]?){
        self.arr = arr
        
      
    }
    func returnArr()->[Post]?{
        return arr
    }
    func returnSingleArr(index:Int)->Post?{
        return arr?[index]
    }
    func returnSingleArrTitle(index:Int)->String{
        return returnSingleArr(index: index)?.email ?? "NA"
    }
    func returnSingleArrBody(index:Int)->String{
        return returnSingleArr(index: index)?.body ?? "NA"
    }
    func returnArrCount()->Int?{
        return arr?.count 
    }
    
}
