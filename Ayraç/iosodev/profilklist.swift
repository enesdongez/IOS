//
//  profilklist.swift
//  iosodev
//
//  Created by Enes Dongez on 3.05.2019.
//  Copyright © 2019 Enes. All rights reserved.
//

class profilkitaplist{
    var kitapid: String?
    var kitapad: String?
    var kitapyazar: String?
    var kullanici: String?
    var id: String?
    
    init(idim:String?,kitapidim:String?,kitapadim:String?,kitapyazar:String?,kullanici:String?){
        self.id=idim
        self.kitapid=kitapidim
        self.kitapad=kitapadim
        self.kitapyazar=kitapyazar
        self.kullanici=kullanici
    }
}
