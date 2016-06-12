//
//  ScanViewController.swift
//  HR
//
//  Created by Sonalee Shah on 2016-06-12.
//  Copyright © 2016 Alexathon. All rights reserved.
//

import UIKit

class ScanViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    
    @IBOutlet weak var ImageDisplay: UIImageView!

    @IBOutlet weak var Camera: UIButton!
        // Do any additional setup after loading the view.
    
    @IBOutlet weak var PhotoLibrary: UIButton!

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func CameraAction(sender: UIButton) {
        
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .Camera
        
        presentViewController(picker, animated: true, completion: nil)
    }
    @IBAction func PhotoLibraryAction(sender: UIButton) {
        
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .PhotoLibrary
        
        presentViewController(picker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        ImageDisplay.image = info[UIImagePickerControllerOriginalImage] as? UIImage;
        dismissViewControllerAnimated(true, completion: nil)
    }


}
