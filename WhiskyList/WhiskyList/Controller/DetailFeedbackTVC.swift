//
//  DetailFeedbackTVC.swift
//  WhiskyList
//
//  Created by Igor Baidak on 24.08.22.
//

import UIKit

class DetailFeedbackTVC: UITableViewController {
    
    
    var index: Int!
    var whiskye: Whisky {
        WhiskyDate.shared.whisky[index]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        whiskye.feedback.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath)
        
        let feedback = whiskye.feedback[indexPath.row]
        
        cell.textLabel?.text = feedback.text
        cell.detailTextLabel?.text = feedback.ratingBar + "\n" + feedback.dateString
        return cell
    }
}
