//
//  toDoListTableViewCell.swift
//  realmSwift
//
//  Created by RK on 06/11/24.
//

import UIKit

class toDoListTableViewCell: UITableViewCell {
    @IBOutlet weak var toDoListLabel: UILabel!
    @IBOutlet weak var deleteTodoButton:UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
