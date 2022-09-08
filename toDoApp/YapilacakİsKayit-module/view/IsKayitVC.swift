//
//  IsKayitVC.swift
//  toDoApp
//
//  Created by melek türüdi on 8.09.2022.
//

import UIKit

class IsKayitVC: UIViewController {

    @IBOutlet weak var yapilacakText: UITextField!
    
    var yapilacak:Yapilacaklar?
    
    var isDetayPresenterNesnesi: ViewToPresenterIsDetayProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //IsDetayRouter.createModule(ref: self)
       
        
        if let y = yapilacak {
            yapilacakText.text = y.yapilacak_is
        }

    
    }
    
   
    @IBAction func btnKayit(_ sender: Any) {
        if let yi = yapilacakText.text ,let y = yapilacak {
            isDetayPresenterNesnesi?.guncelle(yapilacak_id: y.yapilacak_id!, yapilacak_is: yi)
        }
    }
    
    
}
