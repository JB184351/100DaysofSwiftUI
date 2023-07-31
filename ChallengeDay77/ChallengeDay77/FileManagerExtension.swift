//
//  FileManagerExtension.swift
//  ChallengeDay77
//
//  Created by Justin on 7/31/23.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
