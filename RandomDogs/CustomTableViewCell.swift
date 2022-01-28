//
//  CustomTableViewCell.swift
//  RandomDogs
//
//  Created by Bulat Kamalov on 20.01.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var imageCustomCell: UIImageView!
    @IBOutlet weak var labelCustomCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
