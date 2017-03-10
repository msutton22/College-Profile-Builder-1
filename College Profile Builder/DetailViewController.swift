//
//  DetailViewController.swift
//  College Profile Builder
//
//  Created by Maddy Sutton on 1/21/16.
//  Copyright © 2016 Maddy Sutton. All rights reserved.
//

import UIKit
import SafariServices

class DetailViewController: UIViewController, SFSafariViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
let imagePicker = UIImagePickerController()
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var numOfStuTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var collegeTextField: UITextField!
    @IBOutlet weak var websiteTextField: UITextField!
    var college : College!
    override func viewDidLoad() {
        super.viewDidLoad()
        collegeTextField.text = college.name
        locationTextField.text = college.location
        numOfStuTextField.text = String(college.numberOfStudents)
        imageView.image = college.image
        websiteTextField.text = college.website
        imagePicker.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue!, sender: Any!) {
        if (segue.identifier == "mapSegue") {
            let svc = segue!.destination as! MapViewController;
            svc.toPass = locationTextField.text
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imagePicker.dismiss(animated: true) { () -> Void in
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.imageView.image = selectedImage
        }
    }

    @IBAction func onGoPress(_ sender: AnyObject) {
        let url = URL(string: String(websiteTextField.text!))
        let svc = SFSafariViewController(url: url!)
        svc.delegate = self
        self.present(svc, animated: true, completion: nil)

    }
    @IBAction func onTappedSavedButton(_ sender: AnyObject) {
        college.name = collegeTextField.text!
        college.location = locationTextField.text!
        college.numberOfStudents = Int(numOfStuTextField.text!)!
        college.website = websiteTextField.text!
        college.image = imageView.image
    }
    
    @IBAction func onTappedLibrary(_ sender: AnyObject) {
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        present(imagePicker, animated: true, completion: nil)
            }

    @IBAction func onTappedCamera(_ sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            present(imagePicker, animated: true, completion: nil)
        }


    }
    

        }
    

    

    

