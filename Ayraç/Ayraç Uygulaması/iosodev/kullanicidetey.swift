//
//  kullanicidetey.swift
//  iosodev
//
//  Created by Enes Dongez on 4.05.2019.
//  Copyright © 2019 Enes. All rights reserved.
//

import UIKit
import FirebaseDatabase

class kullanicidetey: UIViewController,UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profilkitaplistesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellT = tableView.dequeueReusableCell(withIdentifier: "kpcell",for:indexPath)as! kullanicikitapbar
        
        let kitabimiz:profilkitaplist
        
        kitabimiz = profilkitaplistesi[indexPath.row]
        
        cellT.kullanicikitapad.text=kitabimiz.kitapad
        cellT.kullanicikitapyazar.text=kitabimiz.kitapyazar
        
        
        
        return cellT
    }
    
    
    
    @IBOutlet weak var kdetayprofil: UITableView!
    var ref:DatabaseReference!
      var profilkitaplistesi=[profilkitaplist]()
    var adtut:String?
    var mailtut:String?
    override func viewDidLoad() {
        self.kullanicimail.text=mailtut
        self.kullaniciad.text=adtut
        super.viewDidLoad()

        ref = Database.database().reference().child("profilkitap")
        ref.observe(.value, with: {(snapshot) in
            if snapshot.childrenCount>0{
                self.profilkitaplistesi.removeAll()
                
                //print(snapshot.value as Any)
                
                for kitaplarimiz in snapshot.children.allObjects as![DataSnapshot]{
                    
                    let kitapobjem=kitaplarimiz.value as?[String: AnyObject]
                    let id=kitapobjem?["id"]
                    let kitapid=kitapobjem?["kitapid"]
                    let kullanici=kitapobjem?["kullanicimail"]
                    let kitapad=kitapobjem?["kitapad"]
                    let kitapyazar=kitapobjem?["kitapyazar"]
                    
                    let kitap=profilkitaplist(idim: id as! String, kitapidim: kitapid as! String, kitapadim: kitapad as! String, kitapyazar: kitapyazar as! String, kullanici: kullanici as! String)
                    
                    if kitap.kullanici == self.mailtut{
                        
                        self.profilkitaplistesi.append(kitap)
                        
                        
                    }
                    
                    
                }
                self.kdetayprofil.reloadData()
            }
            
        })
    }
            
 
    
    
    @IBOutlet weak var kullaniciad: UILabel!
    @IBOutlet weak var kullanicimail: UILabel!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
