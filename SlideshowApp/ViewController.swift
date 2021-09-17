//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Kohei Yoshida on 2021/09/15.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    var imageNameArray = [String]()
    var imageNumber = 0
    var timer:Timer!
    
    @IBOutlet weak var startOrStopButton: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var previousButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        imageNameArray.append("penguin1")
        imageNameArray.append("penguin2")
        imageNameArray.append("penguin3")
        
        imageView.image = UIImage(named: imageNameArray[0])
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
         }

    
    
    @IBAction func nextImage(_ sender: Any) {
        
        if imageNumber <= 1 {
            imageNumber += 1
            imageView.image = UIImage(named: imageNameArray[imageNumber])
        } else {
            imageNumber = 0
            imageView.image = UIImage(named: imageNameArray[imageNumber])
        }
       
        
        
        
    }
    
    @IBAction func previousImage(_ sender: Any) {
        if imageNumber == 0 {
            imageNumber = 2
            imageView.image = UIImage(named: imageNameArray[imageNumber])
        } else {
            imageNumber -= 1
            imageView.image = UIImage(named: imageNameArray[imageNumber])
        }
    }
    
    @IBAction func startTimer(_ sender: Any) {
        
        if timer != nil {
            timer.invalidate()
            timer = nil
            startOrStopButton.setImage(UIImage(systemName: "play"), for: .normal)
            
            nextButton.isEnabled = true
            previousButton.isEnabled = true
            
        }else  {
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            
            startOrStopButton.setImage(UIImage(systemName: "stop"), for: .normal)
            
            
            nextButton.isEnabled = false
            previousButton.isEnabled = false
            
            
            
        }
       
    }
    
    @objc func updateTimer() {
        if imageNumber <= 1 {
            imageNumber += 1
            imageView.image = UIImage(named: imageNameArray[imageNumber])
        } else {
            imageNumber = 0
            imageView.image = UIImage(named: imageNameArray[imageNumber])
        }
       
}
    
    
    @IBAction func expansion(_ sender: Any) {
        if timer != nil {
            timer.invalidate()
            timer = nil
        } 
      
        startOrStopButton.setImage(UIImage(systemName: "play"), for: .normal)
        
        nextButton.isEnabled = true
        previousButton.isEnabled = true
        
        self.performSegue(withIdentifier: "next", sender: nil)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "next" {
            let nextVC = segue.destination as! NextViewController
            
            nextVC.selectedImage = imageView.image!
            
            
        }
    }
}
