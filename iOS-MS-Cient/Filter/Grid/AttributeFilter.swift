//
//  AttributeFilter.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/24/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class AttributeFilter: GridFilterElement {
    override public init(values: [String]) {
        super.init(values: values)
        self.name = "attributes"
    }
}
