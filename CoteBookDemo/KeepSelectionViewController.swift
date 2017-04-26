//
//  KeepSelectionViewController.swift
//  CoteBookDemo
//
//  Created by Vansa Pha on 4/26/17.
//  Copyright © 2017 Vansa Pha. All rights reserved.
//

import UIKit

class KeepSelectionViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    var data:[String] = []
    var selection:[Int] = []
    var isEditTable:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        self.data = ["Cotebook", "Swift", "iOS", "Apple", "Cambodia"]
        
    }
    @IBAction func reloadDataPress(_ sender: UIBarButtonItem) {
        self.myTableView.reloadData()
        for i in 0..<self.selection.count {
            self.myTableView.selectRow(at: IndexPath(row: self.selection[i], section: 0), animated: true, scrollPosition: .none)
        }
    }
    
    
    @IBAction func editCellPress(_ sender: UIBarButtonItem) {
        if !self.isEditing {
            self.myTableView.allowsMultipleSelection = true
            self.myTableView.allowsMultipleSelectionDuringEditing = true
            self.myTableView.setEditing(true, animated: true)
            self.isEditing = true
        }else{
            self.myTableView.allowsMultipleSelection = false
            self.myTableView.allowsMultipleSelectionDuringEditing = false
            self.myTableView.setEditing(false, animated: true)
            self.isEditing = false
            self.selection.removeAll()
        }
    }
}

extension KeepSelectionViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = self.data[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.isEditing {
            self.selection.append(indexPath.row)
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if tableView.isEditing {
            for i in 0..<self.selection.count {
                if self.selection[i] == indexPath.row {
                    self.selection.remove(at: i)
                    break
                }
            }
        }
    }
    
}
