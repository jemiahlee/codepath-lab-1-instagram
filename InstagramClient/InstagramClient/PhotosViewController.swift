//
//  PhotosViewController.swift
//  InstagramClient
//
//  Created by Jeremiah Lee on 2/3/16.
//  Copyright © 2016 Jeremiah Lee. All rights reserved.
//

import UIKit
import AFNetworking

class PhotosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var instagramData: NSDictionary!
    let refreshControl = UIRefreshControl()
    
    @IBOutlet weak var photoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl.addTarget(self, action: "loadData:", forControlEvents: UIControlEvents.ValueChanged)
        photoTableView.insertSubview(refreshControl, atIndex: 0)

        photoTableView.dataSource = self
        photoTableView.delegate = self
        
        photoTableView.rowHeight = 320;
        loadData(self.refreshControl)
    }
    
    func loadData(refreshControl: UIRefreshControl) {
        let clientId = "e05c462ebd86446ea48a5af73769b602"
        let url = NSURL(string:"https://api.instagram.com/v1/media/popular?client_id=\(clientId)")
        let request = NSURLRequest(URL: url!)
        let session = NSURLSession(
            configuration: NSURLSessionConfiguration.defaultSessionConfiguration(),
            delegate:nil,
            delegateQueue:NSOperationQueue.mainQueue()
        )
        
        let task : NSURLSessionDataTask = session.dataTaskWithRequest(request,
            completionHandler: { (dataOrNil, response, error) in
                if let data = dataOrNil {
                    if let responseDictionary = try! NSJSONSerialization.JSONObjectWithData(
                        data, options:[]) as? NSDictionary {
                            self.instagramData = responseDictionary
                            self.photoTableView.reloadData()
                            self.refreshControl.endRefreshing()
                    }
                }
        });
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let vc = segue.destinationViewController as! PhotoDetailsViewController
        let indexPath = photoTableView.indexPathForCell(sender as! UITableViewCell)
        let imageURL = self.instagramData["data"]![indexPath!.row]!["images"]!!["standard_resolution"]!!["url"] as! String
        vc.photoUrl = NSURL(string: imageURL)!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let data = self.instagramData {
            return data["data"]!.count
        }
        return 0
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("com.codepath.photocell", forIndexPath: indexPath) as! PhotoTableViewCell
        let imageURL = self.instagramData["data"]![indexPath.row]!["images"]!!["thumbnail"]!!["url"] as! String
        cell.photoImageView.setImageWithURL(NSURL(string: imageURL)!)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("Here")
        tableView.deselectRowAtIndexPath(indexPath, animated:true)
    }
    

}

