//
//  IcerikViewController.swift
//  iosodev
//
//  Created by Enes Dongez on 3.05.2019.
//  Copyright © 2019 Enes. All rights reserved.
//

import UIKit
import FirebaseDatabase

class IcerikViewController: UIViewController {

    var ref:DatabaseReference!
    var ref2:DatabaseReference!

    var kullanicimmail:String?
    var kid:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref2=Database.database().reference().child("profilkitap")
        // Do any additional setup after loading the view.
        ref = Database.database().reference().child("kitaplar")
        ref.observe(.value, with: {(snapshot) in

                
                for kitaps in snapshot.children.allObjects as![DataSnapshot]{
                    
                    let kitapobje=kitaps.value as?[String: AnyObject]
                    let kitapad=kitapobje?["kitapad"]
                    let kitapid=kitapobje?["kitapid"]
                    let kitapozet=kitapobje?["kitapozet"]
                    let kitapsayfa=kitapobje?["kitapsayfa"]
                    let kitapyazar=kitapobje?["kitapyazar"]
                    let kitap=bookmodel(kitapidsi: kitapid as! String, kitapadi: kitapad as! String, kitapsayfasi: kitapsayfa as! String, kitapozeti: kitapozet as! String, resimi: kitapyazar as! String)
                   
                    if kitap.kitapid==self.kitapidim{
                        self.kitapad.text=kitap.kitapad
                        self.kitapsayfa.text=kitap.kitapsayfa
                        self.kitapozet.text=kitap.kitapözet
                        self.yazarad.text=kitap.resim
                        self.kid=kitap.kitapid
                        
                    }
                    
            }
       })
      
        
    }
    
    @IBAction func profilekle(_ sender: Any) {
        addbook()
    }
    var kitapidim:String?
    
    
    @IBOutlet weak var kitapad: UILabel!
    

    
    
    @IBOutlet weak var yazarad: UILabel!
    @IBOutlet weak var kitapsayfa: UILabel!
    @IBOutlet weak var kitapozet: UILabel!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
   func addbook(){
        let key = ref.childByAutoId().key
        
        let kitabim = [
            "id":key,
            "kullanicimail":kullanicimmail! as String,
            "kitapid":kid! as String,
            "kitapad":self.kitapad.text! as String,
            "kitapyazar":self.yazarad.text! as String
            
        ]
        ref2.child(key).setValue(kitabim)
    }

}
