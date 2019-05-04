//
//  hucreayrinti.swift
//  iosodev
//
//  Created by Enes Dongez on 26.04.2019.
//  Copyright © 2019 Enes. All rights reserved.
//

import UIKit

class hucreayrinti: UIViewController {
    @IBOutlet weak var resimbuyuk: UIImageView!
    
    @IBOutlet weak var adbuyuk: UILabel!
    
   var gonderilenad:String?
   // var gonderilenresimadi:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

       // resimbuyuk.image=UIImage(named: gonderilenresimadi!)
        
        adbuyuk.text=gonderilenad
        
        
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
