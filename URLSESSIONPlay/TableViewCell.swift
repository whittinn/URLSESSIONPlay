//
//  TableViewCell.swift
//  URLSESSIONPlay
//
//  Created by Nathaniel Whittington on 3/16/22.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var titleL: UILabel!
    @IBOutlet weak var dateL: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
