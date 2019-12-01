//
//  ViewController2.swift
//  BingeWorthy
//
//  Created by Micah Luckett on 11/30/19.
//  Copyright © 2019 Brian Shuryan. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    @IBOutlet weak var showName: UILabel!
    var showNameText : String!
    @IBOutlet weak var genre: UILabel!
    var genreText : String!
    @IBOutlet weak var seasons: UILabel!
    var seasonsText : String!
    @IBOutlet weak var overview: UILabel!
    var overviewText : String!
    @IBOutlet weak var showImage: UIImageView!
    var showImageText : String!
    @IBOutlet weak var streamer: UIImageView!
    var streamerText : String!
    @IBOutlet weak var recom: UILabel!
    var recomArray : [String] = []
    var finalData : String! = ""
    override func viewDidLoad()
    {
        super.viewDidLoad()
        showName.text = showNameText
        genre.text = "Genre(s): " + genreText
        seasons.text = "Seasons: " + seasonsText
        overview.text = "Brief Description: " + overviewText
        if(streamerText == "Netflix")
        {
            streamer.image = UIImage(named: "Netflix")
        }
        else if (streamerText == "Hulu")
        {
            streamer.image = UIImage(named: "hulu")
        }
        else if (streamerText == "Amazon Prime Video")
        {
            streamer.image = UIImage(named: "amazonprime")
        }
        else
        {
            streamer.image = UIImage(named: "HBO-Logo")
        }
        for n in 0...5
        {
                finalData = finalData + recomArray[n] + "\n"
        }
        recom.text = finalData
        
        get_image(showImageText, showImage)
    }
    
    func get_image(_ url_str:String, _ imageView:UIImageView)
    {
        
        let url:URL = URL(string: url_str)!
        let session = URLSession.shared
        
        let task = session.dataTask(with: url, completionHandler: {
            (
            data, response, error) in
            
            
            if data != nil
            {
                let image = UIImage(data: data!)
                
                if(image != nil)
                {
                    
                    DispatchQueue.main.async(execute: {
                        
                        imageView.image = image
                        imageView.alpha = 0
                        
                        UIView.animate(withDuration: 2.5, animations: {
                            imageView.alpha = 1.0
                        })
                        
                    })
                    
                }
                
            }
            
            
        })
        
        task.resume()
    }
    
}
