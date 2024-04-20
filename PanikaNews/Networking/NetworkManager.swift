import Foundation
struct NetworkManager {
    static let shared = NetworkManager()
    
    func fetchNews(completion: @escaping ([NewsItem]?) -> Void) {
        let urlString = "https://imedinews.ge/api/categorysidebarnews/get"
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Network error: \(error?.localizedDescription ?? "Unknown error")")
                
                completion(nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let newsResponse = try decoder.decode(NewsResponse.self, from: data)
                print("Fetched \(newsResponse.list.count) news items")
                
                DispatchQueue.main.async {
                    completion(newsResponse.list)
                }
            } catch {
                print("Failed to decode JSON: \(error)")
                
                completion(nil)
            }
        }.resume()
    }
}
