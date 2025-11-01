//
//  api.swift
//  Learn-ios
//
//  Created by APPLE on 01/11/25.
//
import Foundation

let BASE_URL = "https://dummyjson.com"
enum Endpoint {
    case GetAll(limit: Int, skip: Int)
    case ByTag(limit: Int, skip: Int, id: String)
    
    var path: String {
        switch self {
        case .GetAll(let limit, let skip):
            return "/recipes?limit=\(limit)&skip=\(skip)"
        case .ByTag(let limit, let skip, let id):
            return "/recipes/tag/\(id)?limit=\(limit)&skip=\(skip)"
        }
    }
}

struct RecipeResponse: Codable {
    let recipes: [Recipe]
    let total: Int
    let skip: Int
    let limit: Int
}

struct Recipe: Codable {
    let id: Int
    let name: String
    let ingredients: [String]
    let instructions: [String]
    let prepTimeMinutes: Int
    let difficulty: String
    let cuisine: String
    let tags: [String]
    let image: String
}

private func createRequest(endpoint: Endpoint) -> URLRequest? {
    guard let url = URL(string: "\(BASE_URL)\(endpoint.path)") else { return nil }
    let request = URLRequest(url: url)
    return request
}

func getAllRecipes(limit: Int, skip: Int) async throws -> RecipeResponse {
    guard let request = createRequest(endpoint: .GetAll(limit: limit, skip: skip)) else { throw "Invalid request" }
    let (data, response) = try await URLSession.shared.data(for: request)
    let encodedData = try JSONDecoder().decode(RecipeResponse.self, from: data)
    return encodedData
}

func getAllRecipesByTag(limit: Int, skip: Int, tag: String) async throws -> RecipeResponse {
    guard let request = createRequest(endpoint: .ByTag(limit: limit, skip: skip, id: tag)) else { throw "Invalid request" }
    let (data, response) = try await URLSession.shared.data(for: request)
    let encodedData = try JSONDecoder().decode(RecipeResponse.self, from: data)
    return encodedData
}
