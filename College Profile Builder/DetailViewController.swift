//
//  DetailViewController.swift
//  College Profile Builder
//
//  Created by Maddy Sutton on 1/21/16.
//  Copyright © 2016 Maddy Sutton. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var numOfStuTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var collegeTextField: UITextField!
    var college : College!
    override func viewDidLoad() {
        super.viewDidLoad()
        collegeTextField.text = college.name
        locationTextField.text = college.location
        numOfStuTextField.text = String(college.numberOfStudents)
        imageView.image = college.image
    }
    @IBAction func onTappedSavedButton(sender: AnyObject) {
        college.name = collegeTextField.text!
        college.location = locationTextField.text!
        college.numberOfStudents = Int(numOfStuTextField.text!)!
    }
}
