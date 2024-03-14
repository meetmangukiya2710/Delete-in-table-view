//
//  ViewController.swift
//  Delete in table view
//
//  Created by R95 on 26/02/24.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var insertTaxtFieldOutlet: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = ["Hello World",
                 "Hello World",
                 "Hello World",
                 "Hello World",
                 "Hello World",
                 "Hello World",
                 "Hello World",
                 "Hello World",
                 "Hello World",
                 "Hello World",
                 "Hello World",
                 "Hello World",
                 "Hello World"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ContantTableViewCell
        
        cell.textLable.text = model[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            model.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
             
            tableView.endUpdates()
        }
    }
    
    
    @IBAction func addDataButtonAction(_ sender: Any) {
        addDataFunc()
    }
    
    func addDataFunc() {
        model.append(insertTaxtFieldOutlet.text!)
        
        let indexpath = IndexPath(row: model.count - 1, section: 0)
        
        tableView.beginUpdates()
        tableView.insertRows(at: [indexpath], with: .automatic)
        tableView.endUpdates()
        
        insertTaxtFieldOutlet.text = ""
        view.endEditing(true)
    }
    
}

