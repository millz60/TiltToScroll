//
//  ViewController.swift
//  TiltToScroll
//
//  Created by Matt Milner on 7/15/16.
//  Copyright © 2016 Matt Milner. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollableTextView: UITextView!
    
    var manager: CMMotionManager!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var yPosition: CGFloat = 0.0
        
        self.manager = CMMotionManager()
        
        if manager.deviceMotionAvailable{
            
            manager.deviceMotionUpdateInterval = 0.125
            
            manager.startDeviceMotionUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler: { (data: CMDeviceMotion?, error: NSError?) in
                
                print(data?.gravity.y)
                
                if let data = data{
                
                    let scrollSpeed = data.gravity.y
                    
                    if scrollSpeed < -0.96{
                            yPosition += self.scrollableTextView.frame.origin.y
                            let newOffset = CGPointMake(0, yPosition)
                            self.scrollableTextView.setContentOffset(newOffset, animated: true)
                    } else if scrollSpeed > -0.880 && scrollSpeed < -0.60{
                            yPosition -= self.scrollableTextView.frame.origin.y
                            let newOffset = CGPointMake(0, yPosition)
                            self.scrollableTextView.setContentOffset(newOffset, animated: true)
                    
                    }

                }
                
                
            })
            
            
            
        }
        
    
    
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

