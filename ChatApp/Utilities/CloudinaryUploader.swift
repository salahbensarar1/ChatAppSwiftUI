//
//  CloudinaryUploader.swift
//  ChatApp
//
//  Created by Salah Ben Sarar on 2024. 12. 13..
//

import Foundation
func uploadToCloudinary(imageData : Data,fileName: String, completion: @escaping (Result<String, Error>) -> Void){
    let cloudName = "dycj9nypi" // Replace with your Cloudinary Cloud Name
        let uploadPreset = "ios_upload_preset" // Replace with your unsigned upload preset
        let url = URL(string: "https://api.cloudinary.com/v1_1/\(cloudName)/image/upload")!
    var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let boundary = UUID().uuidString
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

        var body = Data()
        body.append("--\(boundary)\r\n".data(using: .utf8)!)
        body.append("Content-Disposition: form-data; name=\"file\"; filename=\"\(fileName)\"\r\n".data(using: .utf8)!)
        body.append("Content-Type: image/jpeg\r\n\r\n".data(using: .utf8)!)
        body.append(imageData)
        body.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        body.append("Content-Disposition: form-data; name=\"upload_preset\"\r\n\r\n".data(using: .utf8)!)
        body.append("\(uploadPreset)\r\n".data(using: .utf8)!)
        body.append("--\(boundary)--\r\n".data(using: .utf8)!)

        request.httpBody = body

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data,
                  let jsonResponse = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                  let secureUrl = jsonResponse["secure_url"] as? String else {
                completion(.failure(NSError(domain: "CloudinaryError", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to get secure URL"])))
                return
            }

            completion(.success(secureUrl))
        }.resume()
}
