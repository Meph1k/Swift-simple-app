//
//  AboutTheAuthorViewController.swift
//  Panek
//
//  Created by Panek on 27/05/2019.
//  Copyright © 2019 Panek Team. All rights reserved.
//

import UIKit
import AFNetworking

class AboutTheAuthorViewController: UIViewController {
    @IBOutlet weak var uiImageView: UIImageView!
    
    let URL_IMAGE = URL(string: "https://scontent.fktw1-1.fna.fbcdn.net/v/t1.0-9/33059895_2179783135381830_6193262610842910720_o.jpg?_nc_cat=108&_nc_ht=scontent.fktw1-1.fna&oh=0ef59dafc68a8f4528ae524bcd126611&oe=5D60CE22")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let session = URLSession(configuration: .default)
        
        //creating a dataTask
        let getImageFromUrl = session.dataTask(with: URL_IMAGE!) { (data, response, error) in
            
            //if there is any error
            if let e = error {
                //displaying the message
                print("Error Occurred: \(e)")
                
            } else {
                //in case of now error, checking wheather the response is nil or not
                if (response as? HTTPURLResponse) != nil {
                    
                    //checking if the response contains an image
                    if let imageData = data {
                        
                        //getting the image
                        let image = UIImage(data: imageData)
                        
                        //displaying the image
                        self.uiImageView.image = image
                        
                    } else {
                        print("Image file is currupted")
                    }
                } else {
                    print("No response from server")
                }
            }
        }
        
        //starting the download task
        getImageFromUrl.resume()
        
    }
    
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }
}
