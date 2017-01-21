//
//  ViewController.swift
//  ScrollView
//
//  Created by Munir Wanis on 21/01/17.
//  Copyright © 2017 Munir Wanis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var images = [UIImageView]()
    
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        var contentWidth: CGFloat = 0.0
        
        let scrollWidth = scrollView.frame.size.width
        let scrollHeight = scrollView.frame.size.height
        
        for x in 0...2 {
            let image = UIImage(named: "icon\(x).png")
            let imageView = UIImageView(image: image)
            images.append(imageView)
            
            var newX: CGFloat = 0.0
            
            // Gets the mid of the frame for each image and multiply by x on the loop
            newX = (scrollWidth / 2) + (scrollWidth * CGFloat(x))
            contentWidth += newX
            
            scrollView.addSubview(imageView)
            
            // Default icon size
            let imageSize: CGFloat = 150
            
            // Determines the Y position of the icon in the middle of the screen
            let yPosition: CGFloat = (scrollHeight / 2) - (imageSize / 2)
            
            // Determines de X position of the icon in the middle of the screen
            let xPosition: CGFloat = newX - (imageSize / 2)
            
            imageView.frame = CGRect(x: xPosition, y: yPosition - (imageSize / 2), width: imageSize, height: imageSize)
        }
        scrollView.clipsToBounds = false
        
        scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.size.height)
    }

}

