//
//  AttributeDisplayTypesResource.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/9/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class AttributeDisplayTypesResource<ProductsSM: Decodable> : Resource <ProductsSM> {
    override public func getURI() -> String {
        return "attributedisplaytypes"
    }
}
