//
//  ViewController.swift
//  College Profile Builder
//
//  Created by Maddy Sutton on 1/20/16.
//  Copyright © 2016 Maddy Sutton. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{

    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    var colleges : [College] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editButton.tag = 0
        colleges.append(College(name: "University of Washington", location: "Seattle, WA", numberOfStudents: 44786, image: UIImage(named: "UofW")!, website: "http://www.washington.edu"))
        colleges.append(College(name: "New York University", location: "New York, NY", numberOfStudents: 57245, image: UIImage(named: "nyu")!, website: "http://www.nyu.edu"))
        colleges.append(College(name: "University of Southern California", location: "Los Angeles, CA", numberOfStudents: 43000, image: UIImage(named: "USC")!, website: "http://www.usc.edu"))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    @IBAction func onEditTapped(_ sender: UIBarButtonItem) {
        if sender.tag == 0 {
          tableView.isEditing = true
            sender.tag = 1
        }
        else {
            tableView.isEditing = false
            sender.tag == 0
        }
    }
    
    @IBAction func onTappedPlusButton(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add College", message: nil, preferredStyle: .alert)
        alert.addTextField{(textField) -> Void in textField.placeholder = "Add College Here"
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancel)
        let addAction = UIAlertAction(title: "Add", style: .default) { (action) -> Void in
            let collegeTextField = alert.textFields![0] as UITextField
            self.colleges.append(College(name: collegeTextField.text!))
            self.tableView.reloadData()
        }
        alert.addAction(addAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colleges.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = colleges[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            colleges.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let college = colleges[sourceIndexPath.row]
        colleges.remove(at: sourceIndexPath.row)
        colleges.insert(college, at: destinationIndexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dvc = segue.destination as! DetailViewController
        let index = tableView.indexPathForSelectedRow?.row
        dvc.college = colleges[index!]
    }
    }


