//
//  EnvironmentValues+ImageCache.swift
//  AsyncImage
//
//  Created by Vadim Bulavin on 3/24/20.
//  Copyright © 2020 Vadym Bulavin. All rights reserved.
//

import SwiftUI

struct ImageCacheKey: EnvironmentKey {
    static let defaultValue: ImageCacheAsync = TemporaryImageCache()
}

extension EnvironmentValues {
    var imageCache: ImageCacheAsync {
        get { self[ImageCacheKey.self] }
        set { self[ImageCacheKey.self] = newValue }
    }
}
