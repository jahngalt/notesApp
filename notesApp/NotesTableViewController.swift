//
//  NotesTableViewController.swift
//  notesApp
//
//  Created by Oleg Kudimov on 11/24/19.
//  Copyright © 2019 Oleg Kudimov. All rights reserved.
//

import UIKit

class NotesTableViewController: UITableViewController, UITabBarDelegate {

    @IBAction func composePressed(_ sender: UIBarButtonItem) {
        addNote()
    }
    
    var notes = Array<String>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    
    // set number of rows and set label when table is empty 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.notes.count == 0 {
            let emptyLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height))
            emptyLabel.text = "No Data"
            emptyLabel.textAlignment = NSTextAlignment.center
            self.tableView.backgroundView = emptyLabel
            self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
                return 0
        } else {
            self.tableView.backgroundView = nil
            return self.notes.count
        }
    
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotesCell", for: indexPath)
        
        cell.textLabel?.text = notes[indexPath.row]

        return cell
    }
    
    // can we edit all row? Yes!
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // if we can edit rows, this function will execute
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteNoteAt(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // add footer to our table
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10.0
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    

    func addNote() {
        let note = "Note \(notes.count + 1)"
        notes.append(note)
        tableView.reloadData()
    }
    
    func deleteNoteAt(index: Int) {
        notes.remove(at: index)
        
    }
    
    

}
