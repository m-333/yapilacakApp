//
//  TableViewHucre.swift
//  toDoApp
//
//  Created by melek türüdi on 8.09.2022.
//

import UIKit

class TableViewHucre: UITableViewCell {

    @IBOutlet weak var yapilacakLabel: UILabel!
    
    @IBOutlet weak var tarihLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
