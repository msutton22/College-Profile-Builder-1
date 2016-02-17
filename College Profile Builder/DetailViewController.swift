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
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if (segue.identifier == "mapSegue") {
            var svc = segue!.destinationViewController as! MapViewController;
            svc.toPass = locationTextField.text
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        imagePicker.dismissViewControllerAnimated(true) { () -> Void in
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.imageView.image = selectedImage
        }
    }

    @IBAction func onGoPress(sender: AnyObject) {
        let url = NSURL(string: String(websiteTextField.text!))
        let svc = SFSafariViewController(URL: url!)
        svc.delegate = self
        self.presentViewController(svc, animated: true, completion: nil)

    }
    @IBAction func onTappedSavedButton(sender: AnyObject) {
        college.name = collegeTextField.text!
        college.location = locationTextField.text!
        college.numberOfStudents = Int(numOfStuTextField.text!)!
        college.website = websiteTextField.text!
        college.image = imageView.image
    }
    
    @IBAction func onTappedLibrary(sender: AnyObject) {
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
            }

    @IBAction func onTappedCamera(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
            presentViewController(imagePicker, animated: true, completion: nil)
        }


    }
    

        }
    

    

    

