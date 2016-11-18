//
//  ViewController.swift
//  fienlute-pset3.
//
//  Created by Fien Lute on 15-11-16.
//  Copyright © 2016 Fien Lute. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userInput: UITextField!
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
        //var newTitle = userInput.text!.replacingOccurrences(of: " ", with: "+")
        
        // let myURL = URL(string: "https://www.omdbapi.com/?t="+newTitle+"&y=&plot=short&r=json")
        let myURL = URL(string: "http://www.omdbapi.com/?t=the+lion+king&y=&plot=short&r=json")
        var request = URLRequest(url:myURL!)
        print(request)
        
        URLSession.shared.dataTask(with: myURL!, completionHandler: { data, response, error in
            
            // guards execute when the condition is NOT met.
            guard let data = data, error == nil else {
                print("error: the data could not be found")
                
                // Error handling: what does the user expect when this fails?
                return
            }
            do {
                // Convert data to json. (You'll need the do-catch code for this part.)
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
                    print(json)
                
                // if json.value(forKey: "Response" == "True"){
                    
                    DispatchQueue.main.async {
                        self.label.text = json.value(forKey: "imdbRating") as! String
                    }
                } else {
                    print("convert error")
                    return
                }
                
                // check if the response is true. (was the movie found? what to do if not?)
                // get access to the main thread and the interfacem elements:
                //            DispatchQueue.main.async {
                //               self.label.text = json.value(forKey: "imdbRating") as! String?
                //           }
                
            } catch {
                print ("error: ")
                // error handling: what does the user expect when this fails?
            }
        }).resume()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

