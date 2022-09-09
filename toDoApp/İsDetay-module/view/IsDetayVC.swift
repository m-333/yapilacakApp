//
//  IsDetayVC.swift
//  toDoApp
//
//  Created by melek türüdi on 8.09.2022.
//

import UIKit

class IsDetayVC: UIViewController {

    
    @IBOutlet weak var guncelleText: UITextField!
    var yapilacak:Yapilacaklar?
    
    var isDetayPresenterNesnesi: ViewToPresenterIsDetayProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        IsDetayRouter.createModule(ref: self)
        if let y = yapilacak {
            guncelleText.text = y.yapilacak_is
        }
    }
    
    @IBAction func btnGuncelle(_ sender: Any) {
        if let yi = guncelleText.text, let y = yapilacak {
            isDetayPresenterNesnesi?.guncelle(yapilacak_id: y.yapilacak_id!, yapilacak_is: yi)
        }
    }
    
}
