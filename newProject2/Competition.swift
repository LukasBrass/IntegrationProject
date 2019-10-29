//
//  Competition.swift
//  newProject2
//
//  Created by Lukas Brasseleur on 03/10/2019.
//  Copyright © 2019 Lukas. All rights reserved.
//

import Foundation

class Competition : CustomStringConvertible {
    var name: String
    
    public let id: Int
    public var description: String {"\(self.name)"}

    public init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}
