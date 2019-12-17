//
//  CellPost.swift
//  Sagar_Engineet.AI_Test
//
//  Created by pcq196 on 17/12/19.
//  Copyright © 2019 pcq196. All rights reserved.
//

import Foundation
import UIKit

final class CellPost:UITableViewCell{
    
    //MARK: - Outlets
    @IBOutlet private weak var labelposttitle:UILabel!
    @IBOutlet private weak var labelcreatedat:UILabel!
    @IBOutlet weak var switchactivedeactive:UISwitch!
   
    //MARK: - Variables
    var posthint:Hits?{
        didSet{
            if let hint = self.posthint{
                if let title = hint.title{
                    self.labelposttitle.text = title;
                }
                if let createdat = hint.created_at{
                    self.labelcreatedat.text = createdat;
                }
                self.switchactivedeactive.isOn = hint.isActive;
            }
        }
    }
    
}
