//
//  HomeController.swift
//  newProject2
//
//  Created by Etudiant on 06/09/2019.
//  Copyright © 2019 Lukas. All rights reserved.
//

import UIKit
import Alamofire

class HomeController: UIViewController {

    @IBOutlet var messageLabel: UILabel!
    
    @IBOutlet var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.displayLoader()
        
        self.messageLabel.text = NSLocalizedString("home.title", comment: "")
        
        AF.request("https://api.football-data.org/v2/competitions").responseJSON{(res) in
            guard let response = res.value as? [String: Any] else {
                return
            }
            print(response["competitions"]);
            
            guard let competitionsJson = response["competitions"] as? [String: Any] else {
                print("test")
                return
            }
            print(competitionsJson)
            
            
            
        }
        
        self.display()

        // Do any additional setup after loading the view.
    }
    
    func displayLoader() {
        var animatedImages: [UIImage] = []
        for i in 0 ... 29 {
            if let img = UIImage (named: "frame-\(i)") {
                animatedImages.append(img)
            }
        }
        self.imageView.animationImages = animatedImages
        self.imageView.animationDuration = 0.5
        self.imageView.startAnimating()
    }
    
    func display() {
        AF.request("https://www.w3schools.com/w3css/img_lights.jpg").response{(res) in
            self.imageView.stopAnimating()
            guard let data = res.value as? Data else {
                self.imageView.image = UIImage(named: "not_found.jpg")
                return
            }
            let image = UIImage(data: data)
            self.imageView.image = image
            
            
        }
    }
    
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
