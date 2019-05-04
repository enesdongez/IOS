//
//  DenemeViewController.swift
//  iosodev
//
//  Created by Enes Dongez on 1.05.2019.
//  Copyright © 2019 Enes. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

class DenemeViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var mytableview: UITableView!
    var list:[String]=[]
    
    var kitaplist=[bookmodel]()
    
    var kullanicitut: String?
    
    var handle:DatabaseHandle?
    var ref:DatabaseReference!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kitaplist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for:indexPath)as! bar
        let kitabim:bookmodel
        
        kitabim = kitaplist[indexPath.row]
        cell.kitapadi.text=kitabim.kitapad
       
        cell.kitapyazar.text=kitabim.resim
        
        return cell
    }
    
    @IBAction func ddd(_ sender: Any) {
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
       
        ref = Database.database().reference().child("kitaplar")
        ref.observe(.value, with: {(snapshot) in
            
           if snapshot.childrenCount>0{
                self.kitaplist.removeAll()
              
                //print(snapshot.value as Any)
            
                for kitaps in snapshot.children.allObjects as![DataSnapshot]{
                
                let kitapobje=kitaps.value as?[String: AnyObject]
                let kitapad=kitapobje?["kitapad"]
                let kitapid=kitapobje?["kitapid"]
                let kitapozet=kitapobje?["kitapozet"]
                let kitapsayfa=kitapobje?["kitapsayfa"]
                let kitapyazar=kitapobje?["kitapyazar"]
                
                let kitap=bookmodel(kitapidsi: kitapid as! String, kitapadi: kitapad as! String, kitapsayfasi: kitapsayfa as! String, kitapozeti: kitapozet as! String, resimi: kitapyazar as! String)
                
                self.kitaplist.append(kitap)
                
            }
            self.mytableview.reloadData()
            }
 
        })
        print(kitaplist.count)
        // Do any additional setup after loading the view.
    }
    
    
 
    
    
    

    @IBAction func kullanici(_ sender: Any) {
    performSegue(withIdentifier: "kullanicigecis", sender: nil)
    }
    
    @IBAction func profil(_ sender: Any) {
        performSegue(withIdentifier: "profilgecis", sender: nil)
    }
    @IBAction func hakimizda(_ sender: Any) {
        performSegue(withIdentifier: "hakkimizdagecis", sender: nil)
    }
    @IBAction func cikis(_ sender: Any) {
        performSegue(withIdentifier: "cikisgecis", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="hucreayrintigecis"{
            let geciciviewcon=segue.destination as! IcerikViewController
            let kitabim:bookmodel
            
            
            if let geciciindex=self.mytableview.indexPathForSelectedRow{
                kitabim = kitaplist[geciciindex.row]
                
                geciciviewcon.kitapidim=kitabim.kitapid!
                geciciviewcon.kullanicimmail=kullanicitut
                
            }
        }
        if segue.identifier=="profilgecis"{
            let gecis=segue.destination as? profil
            gecis?.adsoyadim=kullanicitut
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

