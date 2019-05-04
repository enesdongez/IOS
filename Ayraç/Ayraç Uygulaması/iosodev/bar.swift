//
//  bar.swift
//  iosodev
//
//  Created by Enes Dongez on 26.04.2019.
//  Copyright © 2019 Enes. All rights reserved.
//

import UIKit

class bar: UITableViewCell {

    
    @IBOutlet weak var kitapadi: UILabel!
 
    @IBOutlet weak var kitapyazar: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
