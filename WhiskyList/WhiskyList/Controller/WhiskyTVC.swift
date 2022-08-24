//
//  WhiskyTVC.swift
//  WhiskyList
//
//  Created by Igor Baidak on 23.08.22.
//

import UIKit

class WhiskyTVC: UITableViewController {

    // создаем свойство с массивом нашего виски и реализуем get
    var whiskye: [Whisky] {
        WhiskyDate.shared.whisky
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        whiskye.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WhiskyCell", for: indexPath)
        let whisky = whiskye[indexPath.row]
        let price = whiskye[indexPath.row]
        cell.textLabel?.text = whisky.whisky
        cell.detailTextLabel?.text = String(price.price) + " " + "Euro" + "\n" + whisky.ratingBar
        cell.imageView?.image = whisky.image
        return cell
    }
    

    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow,
           let destVC = segue.destination as? DetailWhiskyVC {
               destVC.index = indexPath.row
//            destVC.whisky = WhiskySource.whiskyList[indexPath.row]
//            destVC.price = WhiskySource.price[indexPath.row]
        }
    }
    
    // переход по Unwind с FeedbackVC на WhiskyTVC
    @IBAction func unwindToWhiskyTVC(_ unwindSegue: UIStoryboardSegue) {
        tableView.reloadData()
        
    }
    

}
