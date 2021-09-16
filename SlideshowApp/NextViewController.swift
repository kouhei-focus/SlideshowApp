//
//  NextViewController.swift
//  SlideshowApp
//
//  Created by Kohei Yoshida on 2021/09/16.
//

import UIKit

class NextViewController: UIViewController {
    
    var selectedImage = UIImage()
    
    
    @IBOutlet weak var expansionImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        expansionImage.image = selectedImage

        // Do any additional setup after loading the view.
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
