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
    
    let URL_IMAGE = URL(string: "https://scontent.fktw1-1.fna.fbcdn.net/v/t1.15752-9/61398441_371853653457511_8945866683667447808_n.jpg?_nc_cat=107&_nc_ht=scontent.fktw1-1.fna&oh=83e5551a00c4c32fcf9cc4af34ac1fda&oe=5D925BB6")
    
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
