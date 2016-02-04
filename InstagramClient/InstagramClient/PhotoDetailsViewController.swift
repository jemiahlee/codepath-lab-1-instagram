//
//  PhotoDetailsViewController.swift
//  InstagramClient
//
//  Created by Matthis Perrin on 2/3/16.
//  Copyright © 2016 Jeremiah Lee. All rights reserved.
//

import UIKit

class PhotoDetailsViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    internal var photoUrl: NSURL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoImageView.contentMode = UIViewContentMode.ScaleAspectFit
        photoImageView.setImageWithURL(photoUrl!)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
