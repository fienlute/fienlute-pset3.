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
    
    @IBOutlet weak var tableView: UITableView!
    
    let movies = [hoi, hee, doei]

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
    
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCellSearch
    
    cell.movieName.text = movies[indexPath.row]
        // make movies array with database
        
    let image = UIImage(named: movies[indexPath.row])
        cell.logo.image
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
