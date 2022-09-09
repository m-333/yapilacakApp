//
//  IsKayitVC.swift
//  toDoApp
//
//  Created by melek türüdi on 8.09.2022.
//

import UIKit

class IsKayitVC: UIViewController {

    @IBOutlet weak var yapilacakText: UITextField!
    var isKayitPresenterNesnesi: ViewToPresenterIsKayitProtocol?
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        IsKayitRouter.createModule(ref: self)

    }
    
   
    @IBAction func btnKayit(_ sender: Any) {
        if let ik = yapilacakText.text{
            isKayitPresenterNesnesi?.ekle(yapilacak_is: ik)
            yapilacakText.text=""
        }
    }
    
    
}
