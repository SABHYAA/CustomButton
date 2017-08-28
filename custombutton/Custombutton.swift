//
//  Custombutton.swift
//  custombutton
//
//  Created by appinventiv on 28/08/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class Custombutton: UIViewController {

    @IBOutlet var tableview: UITableView!
    var Array = ["sabhya", "ayushi", "sonali", "farheen", "raveena"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableview.dataSource = self
        tableview.delegate = self
    }

   
    @IBAction func deleteBtn(_ sender: UIButton) {
        guard   let tableCell = getCell(sender) as? Customcell else{fatalError()}
        guard let indexPath = self.tableview.indexPath(for: tableCell) else {fatalError()}
        Array.remove(at: indexPath.row)
        tableview.reloadData()
        print(Array)

    }
}
    
extension Custombutton : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return Array.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Customcell", for: indexPath) as? Customcell
            else{
            fatalError()
            }
                cell.numbersLabel.text = Array[indexPath.row]
                return cell
                
        }
    func getCell(_ button: UIButton) -> UITableViewCell{
        var cell : UIView = button
        while !(cell is Customcell) {
            if let super_view = cell.superview {
                cell = super_view
            }else{}
        }
        guard let tableCell = cell as? Customcell else {fatalError()}
        return tableCell
    }

    
    

}
    class Customcell : UITableViewCell {
        
        @IBOutlet var numbersLabel: UILabel!
}
