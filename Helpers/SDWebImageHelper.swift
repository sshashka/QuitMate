//
//  SDWebImageHelper.swift
//  QuitMate
//
//  Created by Саша Василенко on 01.03.2023.
//

import SDWebImage

final class SDWebImageHelper {
    static var shared = SDWebImageHelper()
    
    func setupSDWebImage() {
        //doing this prevents big memory usage when scrolling I managed to use up to 2G without this
        SDImageCache.shared.config.maxDiskSize = 1024 * 1024 * 10
        SDImageCache.shared.config.shouldCacheImagesInMemory = false
    }
    
    func removeCache() {
        SDImageCache.shared.clearMemory()
        SDImageCache.shared.clearDisk()
    }
}
