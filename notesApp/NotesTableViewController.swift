//
//  NotesTableViewController.swift
//  notesApp
//
//  Created by Oleg Kudimov on 11/24/19.
//  Copyright © 2019 Oleg Kudimov. All rights reserved.
//

import UIKit

class NotesTableViewController: UITableViewController {

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


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return notes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotesCell", for: indexPath)
        
        cell.textLabel?.text = notes[indexPath.row]

        return cell
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
