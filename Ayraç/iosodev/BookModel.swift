//
//  BookModel.swift
//  iosodev
//
//  Created by Enes Dongez on 2.05.2019.
//  Copyright © 2019 Enes. All rights reserved.
//

class bookmodel{
    var kitapid: String?
    var kitapad: String?
    var kitapsayfa: String?
    var kitapözet:String?
    var resim:String?
    
    init(kitapidsi:String?,kitapadi:String?,kitapsayfasi:String?,kitapozeti:String?,resimi:String?){
        self.kitapid=kitapidsi
        self.kitapad=kitapadi
        self.kitapsayfa=kitapsayfasi
        self.kitapözet=kitapozeti
        self.resim=resimi
    }
}
