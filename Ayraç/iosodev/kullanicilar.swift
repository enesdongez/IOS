//
//  kullanicilar.swift
//  iosodev
//
//  Created by Enes Dongez on 4.05.2019.
//  Copyright © 2019 Enes. All rights reserved.
//

import UIKit
import FirebaseDatabase

class kullanicilar: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var kullanicitableview: UITableView!
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kullanicilistesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cellT = tableView.dequeueReusableCell(withIdentifier: "cellkullanici",for:indexPath)as! kullanicibar
        let users:UserModel
        users = kullanicilistesi[indexPath.row]
        
        cellT.kullaniciadsoyad.text=users.adsoyad
        
        return cellT
    }
    
    
    
    var ref:DatabaseReference!
    var kullanicilistesi=[UserModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference().child("kullanicilar")
        ref.observe(.value, with: {(snapshot) in
            
            for users in snapshot.children.allObjects as![DataSnapshot]{
                
                let obje=users.value as?[String: AnyObject]
                let ad=obje?["ad"]
                let kullaniciid=obje?["id"]
                let kullaniciadi=obje?["kullaniciadi"]
                let mail=obje?["mail"]
                let sifre=obje?["sifre"]
                
                let user=UserModel(id: kullaniciid as! String, adsoyad: ad as! String, kadi: kullaniciadi as! String, mail: mail as! String, sifre: sifre as! String)
                self.kullanicilistesi.append(user)
            }
            self.kullanicitableview.reloadData()
        })
    }
    
   
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    if segue.identifier == "kullanicibilgigecis"{
    let geciciviewcon=segue.destination as! kullanicidetey
    let userim:UserModel
    
    
    if let geciciindex=self.kullanicitableview.indexPathForSelectedRow{
        userim = kullanicilistesi[geciciindex.row]
        
        geciciviewcon.adtut=userim.adsoyad!
        geciciviewcon.mailtut=userim.mail!
    
        }
        }
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
