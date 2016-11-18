//
//  ViewController2.swift
//  fienlute-pset3.
//
//  Created by Fien Lute on 17-11-16.
//  Copyright © 2016 Fien Lute. All rights reserved.
//

import UIKit

class ViewController2: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    
    @IBOutlet weak var userInput: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchButton: UIButton!
    
    @IBAction func searchButtonA(_ sender: Any) {
        
        var newTitle = userInput.text!.replacingOccurrences(of: " ", with: "+")
        
        let myURL = URL(string: "https://www.omdbapi.com/?t="+newTitle+"&y=&plot=short&r=json")
        
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
                    //    self.label.text = json.value(forKey: "imdbRating") as! String
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

    let movies = ["The Lion King"]

    override func viewDidLoad() {
     super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // return movies found by search
        return movies.count
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCellSearch
    
        cell.movieTitle.text = movies[indexPath.row]
        // make movies array with database
        
        return cell
    
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
