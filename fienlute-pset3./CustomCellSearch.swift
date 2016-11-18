//
//  CustomCellSearch.swift
//  fienlute-pset3.
//
//  Created by Fien Lute on 17-11-16.
//  Copyright © 2016 Fien Lute. All rights reserved.
//

import UIKit

class CustomCellSearch: UITableViewCell {

    @IBOutlet weak var movieLogo: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieYear: UILabel!
    @IBOutlet weak var movieGrade: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
