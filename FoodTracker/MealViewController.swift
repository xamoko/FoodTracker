//
//  MealViewController.swift
//  FoodTracker
//
//  Created by Xavier Morales on 25/01/15.
//  Copyright © 2015 Xavier Morales. All rights reserved.
//

import UIKit

class MealViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var nameTextField: UITextField!
 
    //@IBOutlet weak var mealNameLabel: UILabel!
    
    @IBOutlet weak var photoImageView: UIImageView!
 
    @IBOutlet weak var ratingControl: RatingControl!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    var meal : Meal?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if saveButton === sender {
            
            let name = nameTextField.text ?? ""
            let photo = photoImageView.image
            let rating = ratingControl.rating
            
            meal = Meal(name: name, photo: photo, rating: rating)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        //hide the keyboard
        textField.resignFirstResponder()
        return true
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
       // mealNameLabel.text = textField.text
    }

    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        //dismiss the picker if the user canceled
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        photoImageView.image = selectedImage
        
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: UITextFieldDelegate
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        
        // Hide the keyboard.
        
        nameTextField.resignFirstResponder()
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        
         let imagePickerController = UIImagePickerController()
        
         // Only allow photos to be picked, not taken.
         imagePickerController.sourceType = .photoLibrary
        
         // Make sure ViewController is notified when the user picks an image.
         imagePickerController.delegate = self
        
        present(imagePickerController, animated: true, completion: nil)    }
   
    
    

    
    

}

