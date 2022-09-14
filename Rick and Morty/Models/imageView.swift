//
//  imageView.swift
//  Rick and Morty
//
//  Created by Olegio on 14.09.2022.
//

import UIKit

class ImageView: UIImageView {
    
    func fetchImage(with url: String?) {
        guard let url = url else { return }
        guard let imageUrl = url.getUrl() else {
            image = UIImage(named: "Frame 1")
            return
        }
        
        // Если изображение есть в кеше, используем его
        if let cashedImage = getCachedImage(url: imageUrl) {
            image = cashedImage
            return
        }
        
        // Если изображения нет в кеше, создаем сессию и грузим из сети
        URLSession.shared.dataTask(with: imageUrl) { data, responce, error in
            
            if let error = error { print(error); return }
            guard let data = data, let responce = responce else { return }
            guard let responceUrl = responce.url else { return }
            
            if responceUrl.absoluteString != url { return }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
            
            // Сохраняем изображение в кеш
            self.saveImageToCache(data: data, responce: responce)
            
        }.resume()
    }
    
    private func saveImageToCache(data: Data, responce: URLResponse) {
        guard let responceUrl = responce.url else { return }
        let cachedResponce = CachedURLResponse(response: responce, data: data)
        URLCache.shared.storeCachedResponse(cachedResponce, for: URLRequest(url: responceUrl))
    }
    
    private func getCachedImage(url: URL) -> UIImage? {
        if let cacheResponce = URLCache.shared.cachedResponse(for: URLRequest(url: url)) {
            return UIImage(data: cacheResponce.data)
        }
        return nil
    }
}

// Расширение для String
fileprivate extension String {
    func getUrl() -> URL? {
        guard let url = URL(string: self) else { return nil }
        return url
    }
}
